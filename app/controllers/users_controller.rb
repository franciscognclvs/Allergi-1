class UsersController < ApplicationController
	skip_before_action :authenticate_user!
	before_action :authenticate_doctor!

	def index
		@users = User.where(doctor: current_doctor)
	end

end