class AllergiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    @medicines = Medicine.all
  end

  def show
    @allergy = Allergy.find(params[:id])
    @allergies_reactions = AllergiesReaction.new
  end

  def new
    @allergy = Allergy.new
    @medicine = Medicine.find(params[:medicine_id])
  end

  def create
    @allergy = Allergy.new
    @allergy.medicine = Medicine.find(params[:medicine_id])
    @allergy.user = current_user
    if @allergy.save
      redirect_to allergy_path(@allergy)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def allergy_params
    params.require(:allergy).permit(:medicine_id)
  end
end
