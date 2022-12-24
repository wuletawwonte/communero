class SubCommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_comment
  before_action :set_sub_comment, only: %i[show edit update destroy]

  # GET /sub_comments or /sub_comments.json
  def index
    @sub_comments = SubComment.all
  end

  # GET /sub_comments/1 or /sub_comments/1.json
  def show; end

  # GET /sub_comments/new
  def new
    @sub_comment = SubComment.new
  end

  # GET /sub_comments/1/edit
  def edit; end

  # POST /sub_comments or /sub_comments.json
  def create
    @sub_comment = @comment.sub_comments.build(sub_comment_params)
    @sub_comment.user = current_user

    respond_to do |format|
      if @sub_comment.save
        format.turbo_stream
        format.html { redirect_to comment_sub_comments_path(@comment), notice: 'Reply added successfully.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@comment)}_form", partial: 'form',
                                                                                        locals: { comment: @comment })
        end
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_comments/1 or /sub_comments/1.json
  def update
    respond_to do |format|
      if @sub_comment.update(sub_comment_params)
        format.html { redirect_to sub_comment_url(@sub_comment), notice: 'Sub comment was successfully updated.' }
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
      format.html { redirect_to sub_comments_url, notice: 'Sub comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sub_comment
    @sub_comment = SubComment.find(params[:id])
  end

  # Use callbacks to share comment constraints between actions.
  def set_comment
    @comment = Comment.includes(:user).find(params[:comment_id])
  end

  # Only allow a list of trusted parameters through.
  def sub_comment_params
    params.require(:sub_comment).permit(:content, :comment_id)
  end
end
