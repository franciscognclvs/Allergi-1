class AllergiesReactionsController < ApplicationController

  def new
    @allergy = Allergy.find(params[:allergy_id])
    @allergies_reaction = AllergiesReaction.new
  end

  def create
    @allergy = Allergy.find(params[:allergies_reaction][:allergy])
    @reaction = Reaction.find(params[:allergies_reaction][:reaction_id])
    @allergies_reaction = AllergiesReaction.new
    @allergies_reaction.allergy = @allergy
    @allergies_reaction.reaction = @reaction
    if @allergies_reaction.save
      redirect_to medicine_allergy_path(@allergy.medicine, @allergy)
    else
      render :new
    end
  end

  private

  def allergies_reactions_params
    params.require(:allergies_reaction).permit(:allergy, :reaction)
  end
end
