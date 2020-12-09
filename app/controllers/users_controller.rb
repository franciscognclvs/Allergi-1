class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_doctor!

	
  def index
    @users = User.where(doctor: current_doctor)
  end
  
  def show
    @user = User.find(params[:id])
    @active_problem = ActiveProblem.new
    @active_problems = ActiveProblem.where(doctor:current_doctor, user: @user)
	end
  
end
