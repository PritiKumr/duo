class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :rememberable, :recoverable

  belongs_to :account
  has_many :entries

  default_scope -> { order 'id' }

  def entry_for date:
    entries.find_or_create_by date: date
  end

end
