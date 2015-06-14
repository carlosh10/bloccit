class FavoritesController < ApplicationController

   def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)
     authorize favorite
     
     if favorite.save
          flash[:notice] = "Post was favorited."
          redirect_to [post.topic, post]
     else
          flash[:error] = "There was an error favoriting the post."
          redirect_to [post.topic, post]
     end
   end

   def destroy
    # Get the post from the params
     post = Post.find(params[:post_id])
    # Find the current user's favorite with the ID in the params
     favorite = current_user.favorites.build(post: post)
     authorize favorite

   if favorite.destroy
     # Flash success and redirect to @post
      flash[:notice] = "Post was unfavorited."
      redirect_to [post.topic, post]
   else
     # Flash error and redirect to @post
      flash[:error] = "There was an error unfavoriting."
      redirect_to [post.topic, post]
   end
 end

end


