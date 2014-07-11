class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  validates :user, presence: true
  validates :body, presence: true
  # validates_associated :comments

end