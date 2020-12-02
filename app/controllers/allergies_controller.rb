class AllergiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def index
  end

  def show
  end

  def new
    @allergy = Allergy.new
  end

  def create
  end

  def destroy
  end
end
