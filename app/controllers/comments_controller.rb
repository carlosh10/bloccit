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
         else
           flash[:error] = "Comment couldn't be deleted. Try again."
         end

      respond_to do |format|
       format.html
       format.js
     end
      end

      def create
        @post = Post.find(params[:post_id])
        @comments = @post.comments

        @comment = current_user.comments.build( comment_params )
        @comment.post = @post
        @new_comment = Comment.new

        authorize @comment

        if @comment.save
          flash[:notice] = "Comment was created."
        else
          flash[:error] = "There was an error saving the comment. Please try again."
        end

        respond_to do |format|
          format.html
          format.js
        end
      end
  
  private

      def comment_params
        params.require(:comment).permit(:body)
      end
end



