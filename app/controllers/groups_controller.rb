class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy create_post]

  # GET /groups or /groups.json
  def index
    @groups = Group.all.order(created_at: :desc).page params[:page]
  end

  # GET /groups/1 or /groups/1.json
  def show
    @members = User.members_of(@group)
    @post = Post.new
    @posts = @group.posts
  end

  # GET /groups/new
  def new
    @group = Group.new
    render partial: 'modal', locals: { group: @group } if turbo_frame_request?
  end

  # GET /groups/1/edit
  def edit
    render partial: 'modal', locals: { group: @group } if turbo_frame_request?
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)
    @group.user = current_user

    respond_to do |format|
      if @group.save
        format.turbo_stream
        format.html { redirect_to group_url(@group), notice: 'Group was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_post
    @post = Post.new(post_params)
    @post.user = current_user
    @post.group = @group

    respond_to do |format|
      if @post.save
        format.turbo_stream
        format.html { redirect_to group_url(@group), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
