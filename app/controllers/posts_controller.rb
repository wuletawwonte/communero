class PostsController < ApplicationController

  def show
  end

  def index
  end

  private

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :group_id)
    end

end
