class EntriesController < ApplicationController
  def index
    @date = Date.today
    @entries = current_partners.map { |partner|  
      partner.entry_for date: @date
    }
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update entry_params
    head :ok
  end

  private

  def current_partners
    @_current_partners ||= current_account.partners
  end

  def entry_params
    params.require(:entry).permit(:id, :text)
  end
end
