class AllergiesReactionsController < ApplicationController

  def create
    reaction_ids = params[:allergies_reaction][:reaction_id]
    allergy = Allergy.find(params[:allergy_id])
    reaction_ids.each do |reaction_id|
      AllergiesReaction.create(reaction_id: reaction_id, allergy: allergy)
    end
    redirect_to medicine_path(allergy.medicine)
  end
end
