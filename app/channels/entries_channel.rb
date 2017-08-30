class EntriesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'entries'
  end
end