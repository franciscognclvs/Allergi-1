class AllergiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
  end

  def show
  end

  def create
    @medicine = Medicine.find(params[:medicine_id])
    @allergy = Allergy.new(allergy_params)
    @allergy.user = current_user
    @allergy.substance = @medicine.compound_mix.substance
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
    params.require(:allergy).permit(reaction_attributes: [:id, :name, :_destroy])
end
