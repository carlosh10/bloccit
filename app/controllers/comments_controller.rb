class CommentsController < ApplicationController
  def new
  end

  def show
      @post = Post.find(params[:id])
      @comment = curent_user.posts.Comment.find(params[:comment_id])
  end

  def edit
  end

  def destroy
   @topic = Topic.find(params[:topic_id])
   @post = @topic.posts.find(params[:post_id])
   @comment = @post.comments.find(params[:id])
 
   authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
  end

  def create
    @post = Post.find(params[:post_id])
     @comment = Comment.new(params.require(:comment).permit(:body))
     authorize @comment
     @comment.user = current_user
     @comment.post = @post

    if @comment.save
      flash[:notice] = "Post was saved."
      redirect_to [@comment.post.topic, @comment.post]

    else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
    end
  end

end



