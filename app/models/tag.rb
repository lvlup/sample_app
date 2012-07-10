class Tag < ActiveRecord::Base
  attr_accessible :name, :post_id

  has_many :post_tag_relation, dependent: :destroy
  has_many :posts, :through => :post_tag_relation

  validates :name, :presence => true, :allow_blank => false
   
  def feeed
    Post.where("user_id = ?", id)
  end
  
end
