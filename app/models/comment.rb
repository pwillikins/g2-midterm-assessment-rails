class Comment < ActiveRecord::Base

    belongs_to :user
    belongs_to :post

    validates :user, presence: true
    validates_presence_of :comment,  message: " cannot be blank"
end