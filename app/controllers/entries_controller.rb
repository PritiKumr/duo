class EntriesController < ApplicationController
  def index
    @date = Date.today
    @entries = current_partners.map { |partner|  
      partner.entry_for date: @date
    }
  end

  def update
    
  end

  private

  def current_partners
    @_current_partners ||= current_account.partners
  end
end
