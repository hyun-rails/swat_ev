class PostsController < ApplicationController
  before_action :signed_in_user

  def new
    @post = Post.new
  end


  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "New Post created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  def index
  	@posts = Post.paginate(page: params[:page])
  end

  def show
  	@post = Post.find(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:department, :professor, :course,
                                   :title, :content)
    end
end