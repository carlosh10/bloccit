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

        #first, grab the post via post_id
         @post = Post.find(params[:post_id])

        #second derive topic from post
         @topic = @post.topic

         @comment = @post.comments.find(params[:id])
     
         authorize @comment
         if @comment.destroy
           flash[:notice] = "Comment was removed."
           redirect_to [@post.topic, @post]
         else
           flash[:error] = "Comment couldn't be deleted. Try again."
           redirect_to [@post.topic, @post]
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
          redirect_to [@post.topic, @post]

        else
           flash[:error] = "There was an error saving the post. Please try again."
           redirect_to [@post.topic, @post]
        end
      end

end



