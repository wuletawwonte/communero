class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]

  # GET /members or /members.json
  def index
    @members = Member.all
  end

  # GET /members/1 or /members/1.json
  def show; end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit; end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)
    @member.role = 'joined'
    @member.user = current_user

    respond_to do |format|
      if @member.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "#{helpers.dom_id(@member.group)}_group",
            partial: 'groups/group',
            locals: { group: @member.group }
          )
        end
        format.html { redirect_to groups_url, notice: 'Member was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to member_url(@member), notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @group = Group.find(params[:group_id])
    @member.destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "#{helpers.dom_id(@group)}_group",
          partial: 'groups/group',
          locals: { group: @group }
        )
      end
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def member_params
    params.permit(:group_id)
  end
end
