class Account < ApplicationRecord
  has_many :users
  alias_attribute :partners, :users

  def tz
    'Asia/Kolkata'
  end
end

