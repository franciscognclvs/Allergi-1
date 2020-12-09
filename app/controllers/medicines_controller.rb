class MedicinesController < ApplicationController
   skip_before_action :authenticate_user!
   before_action :set_allergies, only: [:show, :emergency]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR principle ILIKE :query OR laboratory ILIKE :query"
      @medicines = Medicine.where(sql_query, query: "%#{params[:query]}%")
    else
      @medicines = Medicine.all
    end
  end

  def show
  end

  def create
  end

  def destroy
  end

  def emergency
  end

  private

  def set_allergies
    @medicine = Medicine.find(params[:id])
    @allergies = Allergy.includes(:reactions).where(user: current_user, medicine: @medicine)
  end
end
