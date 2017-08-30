class Account < ApplicationRecord
  has_many :users
  has_one :invitation
  alias_attribute :partners, :users

  def tz
    'Asia/Kolkata'
  end
end

