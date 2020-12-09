class MedicinesController < ApplicationController
 	skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR principle ILIKE :query OR laboratory ILIKE :query"
      @medicines = Medicine.where(sql_query, query: "%#{params[:query]}%")
    else
      @medicines = Medicine.all
    end
  end

  def show
    @medicine = Medicine.find(params[:id])
    @allergies = current_user.allergies
    @allergies.each do |allergy|
      @allergies_reactions = AllergiesReaction.where(allergy_id: allergy.id)
    end
    @allergies_reactions.each do |reaction|
      @reactions = Reaction.where(id: reaction.reaction_id)
    end
  end

  def create
  end

  def destroy
  end

  def emergency
    @appointment = current_user.appointments.last
  end
end
