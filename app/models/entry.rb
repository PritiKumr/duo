class Entry < ApplicationRecord
  belongs_to :user

  def author_name
    user.name
  end
end
