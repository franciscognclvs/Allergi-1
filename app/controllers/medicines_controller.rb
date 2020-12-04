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
  end

  def create
  end

  def destroy
  end
end
