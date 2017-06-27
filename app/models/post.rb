class Post < ApplicationRecord
  belongs_to :user

  def author
    user.name
  end
end
