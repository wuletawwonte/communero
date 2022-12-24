class SubCommentsController < ApplicationController
  before_action :set_sub_comment, only: %i[ show edit update destroy ]

  # GET /sub_comments or /sub_comments.json
  def index
    @sub_comments = SubComment.all
  end

  # GET /sub_comments/1 or /sub_comments/1.json
  def show
  end

  # GET /sub_comments/new
  def new
    @sub_comment = SubComment.new
  end

  # GET /sub_comments/1/edit
  def edit
  end

  # POST /sub_comments or /sub_comments.json
  def create
    @sub_comment = SubComment.new(sub_comment_params)

    respond_to do |format|
      if @sub_comment.save
        format.html { redirect_to sub_comment_url(@sub_comment), notice: "Sub comment was successfully created." }
        format.json { render :show, status: :created, location: @sub_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_comments/1 or /sub_comments/1.json
  def update
    respond_to do |format|
      if @sub_comment.update(sub_comment_params)
        format.html { redirect_to sub_comment_url(@sub_comment), notice: "Sub comment was successfully updated." }
        format.json { render :show, status: :ok, location: @sub_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_comments/1 or /sub_comments/1.json
  def destroy
    @sub_comment.destroy

    respond_to do |format|
      format.html { redirect_to sub_comments_url, notice: "Sub comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_comment
      @sub_comment = SubComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_comment_params
      params.fetch(:sub_comment, {})
    end
end
