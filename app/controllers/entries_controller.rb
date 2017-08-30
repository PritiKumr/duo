class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_filter :check_if_account_has_two_users
  helper_method :editing_locked?
  helper_method :current_user_author?
  
  def index
    validate_and_set_date.tap do |date|
      @entries = current_partners.map { |partner|  
        partner.entry_for date: date
      }
    end
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update entry_params
      ActionCable.server.broadcast 'entries',
        entry: @entry.text,
        id: @entry.id
      head :ok
    end
  end

  def user_detail
    render json: {user: current_user}
  end

  private
  
  def check_if_account_has_two_users
    if current_partners.count < 2
      redirect_to new_invitation_path
    end
  end

  def editing_locked? entry
    !current_user_author?(entry) || time_expired?(entry)
  end

  def current_user_author? entry
    current_user == entry.user
  end

  def time_expired? entry
    Time.use_zone current_account.tz do
      entry.date.end_of_day + expiry_offset < Time.current
    end
  end

  def expiry_offset
    8.hours
  end

  def validate_and_set_date
    @date = Time.use_zone current_account.tz do
      Date.parse(params[:date]).tap do |date|
        raise! if date.future?
      end rescue Date.current
    end
  end

  def current_partners
    @_current_partners ||= current_account.partners
  end

  def entry_params
    params.require(:entry).permit(:id, :text)
  end
end
