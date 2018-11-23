class Api::V1::PostsController < Api::BaseController
  def index
    @posts = Post.all.order(created_at: :desc)

    render json: @posts
  end

  def show
    @post = Post.find(params[:id])

    render json: @post
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      render status: :created
    else
      render json: {errors: @post.errors}, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end