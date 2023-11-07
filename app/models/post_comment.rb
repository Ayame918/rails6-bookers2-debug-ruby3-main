class PostComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :book
  
  validates :comment, presence: true#空のコメントが保存されないようにする
end
