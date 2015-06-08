class CommentsController < ApplicationController
  def new
  end

  def show
      @post = Post.find(params[:id])
      @comment = curent_user.posts.Comment.find(params[:comment_id])
  end

  def edit
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



