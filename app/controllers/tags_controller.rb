# encoding: utf-8
class TagsController < ApplicationController


 def show
   @posts = Tag.find(params[:id]).posts
 end


 def index
    @title = "Все метки"
    @tags = Tag.paginate(:page => params[:page],:per_page => 20)
    @tags = Tag.all
  end


end
