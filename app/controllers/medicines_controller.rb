class MedicinesController < ApplicationController
 	skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      @medicines = Medicine.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @medicines = Medicine.all
    end
  end

  def show
    @medicine = Medicine.new
  end

  def create
  end

  def destroy
  end

  def search_medicine
  	@remedios = []
  	consultas = Medicine.consulta_remedio(params[:remedio])
  	consultas.search('.result-item').each do |remedio|
		title = remedio.search('a').attribute('title').value
		photo = remedio.search('img').last.values[3].split("//")[2]
		laboratory = remedio.search('.result-item__meta-info-text').last.children.text
		substance = remedio.search('.result-item__meta-info-text').first.children.text
		@remedios.push({title: title, photo: photo, laboratory: laboratory, substance: substance}) 
  	end
  	return @remedios
  end
end
