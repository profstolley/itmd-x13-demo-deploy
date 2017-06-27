class User < ApplicationRecord
  validates :uid, uniqueness: true
  has_many :posts
end
