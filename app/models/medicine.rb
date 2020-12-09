require 'open-uri'
require 'nokogiri'

class Medicine < ApplicationRecord
  has_many :compound_mixes
  has_many :substances, through: :compound_mixes
  has_one_attached :photo
  has_many :allergies
  has_many :reactions, through: :allergies

  # def self.consulta_remedio(params)
  #   busca_remedio = "https://consultaremedios.com.br/b/#{params}"
  #   body = Nokogiri::HTML(open(busca_remedio).read)
  #   return body
  # end
end
