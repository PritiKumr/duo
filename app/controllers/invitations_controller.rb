class InvitationsController < ApplicationController
  before_action :authenticate_user!, except: [:accept]
  
  def create
  	@invitation = Invitation.new(create_params)
  	@invitation.account_id = current_user.account_id
  	@invitation.token = rand.to_s[2..9]
    respond_to do |format|
      if @invitation.save
        format.html { redirect_to success_invitations_path, notice: 'Invitation was successfully created.' }
        InvitationsMailer.invite(@invitation).deliver
      else
        format.html { render :new }
      end
    end
  end

  def success
  end

  def accept
    unless user_signed_in?
      @invitation = Invitation.find_by_token(params[:token])
      render :template => "devise/registrations/new" 
    else 
      redirect_to new_invitation_path
    end
  end

  def new
    if current_account.invitation.nil?
    	@invitation = Invitation.new
    else
      redirect_to success_invitations_path, notice: 'You have already sent an Invitation'
    end
  end

  private
  def create_params
  	params.require(:invitation).permit(:id, :account_id, :email, :token)
  end

end
