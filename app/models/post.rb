# encoding: utf-8
class Post < ActiveRecord::Base
  attr_accessible :content, :title, :tag_names
  attr_writer :tag_names
  before_validation :assign_tags

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :post_tag_relation, dependent: :destroy
  has_many :tags, :through => :post_tag_relation
  
  validates :tags, :presence => true
  validates :user_id, :presence => true
  validates :title, :presence => true,:length => { :minimum => 5 }
  validates :content, :presence => true,:length => { :minimum => 5 }

  default_scope :order => 'posts.created_at DESC'

  def tag_names 
    @tag_names || tags.to_a.map(&:name).join(', ')
  end
  
 def tag_name
   (@tag_names.to_a + tags.to_a.map(&:name)) 
 end

 private
  
  def assign_tags
   if @tag_names
        self.tags=@tag_names.split(/\s+/).map do |name|
          Tag.find_or_create_by_name(name)  
        end
   end
  end
 
end
