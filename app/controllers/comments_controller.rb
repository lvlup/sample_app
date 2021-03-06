# encoding: utf-8
class CommentsController < ApplicationController

  
 def new
   @comment = Comment.new
 end
  

 def create
  @post = Post.find(params[:post_id])  
    if signed_in?
      @comment = @post.comments.build(params[:comment])
      @comment.post = @post
      @comment.user = @current_user
   else 
      @comment = Comment.new(params[:comment])
      @comment.post = @post
      @comment.user=nil
   end
    
   if @comment.save
      flash[:success] = "Комментарий оставлен!"
      redirect_to post_path(@post)
   else
      render 'shared/_comment_form' 
   end
 end
  

end
