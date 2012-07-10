# encoding: utf-8
class Comment < ActiveRecord::Base
 attr_accessible :body
  belongs_to :user
  belongs_to :post
  
  

  
  validates :post_id, :presence => true 
  validates :body, :presence => true,:length => { :minimum => 5 }
 
end
