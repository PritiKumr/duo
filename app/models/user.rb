class User < ApplicationRecord
  has_many :entries

  def entry_for date:
    entries.find_or_create_by date: date
  end

end
