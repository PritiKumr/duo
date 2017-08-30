class InvitationsMailer < ApplicationMailer

  def invite invitation
    @invitation = invitation
    mail to:"#{@invitation.email}", subject: "Accept the invitation"
  end
end
