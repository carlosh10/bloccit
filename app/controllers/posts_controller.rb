class PostsController < ApplicationController
  

  before_action :flash_attack, except: [:index,]
  skip_before_action :flash_attack, only: [:index, :show]

  def index
    @posts = Post.all
    authorize @posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
     @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

   def update
    flash_attack
     @post = Post.find(params[:id])
     authorize @post
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

  protected

  def flash_attack
    flash[:test] = "I am flash on the post controller"
  end


end
