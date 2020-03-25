class Users::RegistrationsController < Devise::RegistrationsController

def new
	super
end

def create
	@user = User.new(params[:user])
	
end

def update
	super
end

end