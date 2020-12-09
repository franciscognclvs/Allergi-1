class ActiveProblemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create
  def create
    @active_problem = ActiveProblem.new(active_problem_params)
    @active_problem.doctor = current_doctor
    @active_problem.save
    redirect_to user_path(@active_problem.user)
  end

  def active_problem_params
    params.require(:active_problem).permit(:problem, :user_id)
  end
end
