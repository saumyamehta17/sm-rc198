class Post < ActiveRecord::Base
  validates_presence_of :name
  has_many :comments

end
