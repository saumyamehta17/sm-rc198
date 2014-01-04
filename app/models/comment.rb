class Comment < ActiveRecord::Base
  belongs_to :post
  validates_uniqueness_of :name
  validates_uniqueness_of :content
end
