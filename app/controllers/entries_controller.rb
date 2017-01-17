class EntriesController < ApplicationController
  def index
    @date = Date.today
    @entries = Entry.for date: @date
  end
end
