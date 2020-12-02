class MedicinesController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  def index
  end

  def show
  end

  def new
    @medicine = Medicine.new
  end

  def create

  end

  def destroy
  end

  
end
