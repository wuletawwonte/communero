class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_group
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = @group.posts.includes(:user)
    @members = User.members_of(@group)
    @post = @group.posts.build
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = @group.posts.build
  end

  # GET groups/1/posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = @group.posts.build(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.turbo_stream
        format.html { redirect_to group_posts_path(@group), notice: 'Post was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "#{helpers.dom_id(@post)}_form", 
            partial: 'form',
            locals: { post: @post })
        end
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.turbo_stream
        format.html { redirect_to group_posts_path(@group), notice: 'Post was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Use callbacks to share common group between actions.
  def set_group
    @group = Group.find(params[:group_id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :group_id, :id)
  end
end
