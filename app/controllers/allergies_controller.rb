class AllergiesController < ApplicationController
    skip_before_action :authenticate_user!, only: :show

  def index
  end

  def show
  end

  def create
  end

  def destroy
  end
end
