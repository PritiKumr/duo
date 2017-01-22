class User < ApplicationRecord
  has_many :entries

  def entry_for date:
    entries.first_or_create date: date
  end

end
