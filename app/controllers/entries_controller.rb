class EntriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @date = selected_date
    @entries = current_partners.map { |partner|  
      partner.entry_for date: @date
    }
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update entry_params
    head :ok
  end

  def user_detail
    render json: {user: current_user}
  end

  private

  def selected_date
    Date.parse(params[:date]) rescue Date.today
  end

  def current_partners
    @_current_partners ||= current_account.partners
  end

  def entry_params
    params.require(:entry).permit(:id, :text)
  end
end
