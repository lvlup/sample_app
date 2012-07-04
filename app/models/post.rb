# encoding: utf-8
class Post < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :user
  has_many :comments, dependent: :destroy
  

  validates :user_id, :presence => true
  validates :title, :presence => true,:length => { :minimum => 5 }
  validates :content, :presence => true,:length => { :minimum => 5 }
  default_scope :order => 'posts.created_at DESC'
  
  
  
end
