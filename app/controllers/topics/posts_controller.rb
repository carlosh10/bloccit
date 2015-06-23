class Topics::PostsController < ApplicationController
  


  # def index
  #   #@posts = Post.all
  #   #@posts = policy_scope(Post)
  #   @posts = PostPolicy::Scope.new(current_user, Post).resolve
  #   authorize @posts
  # end

  def show
    @post = Post.find(params[:id])
      @topic = Topic.find(params[:topic_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
     @topic = Topic.find(params[:topic_id])
     @post = current_user.posts.build(post_params)

        authorize @post
    if @post.save
      @post.create_vote
      flash[:notice] = "Post was saved."
      #redirect_to @post
       render :show
    else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def destroy
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post

     if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end
  
   def update
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
       authorize @post
     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       render :show
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end


   private

   def post_params
    params.require(:post).permit(:title, :body, :image)
   end


end
