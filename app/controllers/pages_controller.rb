# encoding: utf-8
class PagesController < ApplicationController
  def home
   @title = "Home"
   if signed_in?
      @post = Post.new
      @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 5)
   end
  end

  def contact
   @title = "Contact"
  end
  
  def about
   @title = "About"
  end
  
  def posts
   @title = "Посты"
  end
  
 

end
