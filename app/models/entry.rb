class Entry < ApplicationRecord
  belongs_to :user

  def self.for date:
    [
      self.new(text: 'Hello'), 
      self.new(text: 'Hello')
    ]
  end
end
