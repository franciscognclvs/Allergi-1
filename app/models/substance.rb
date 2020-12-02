class Substance < ApplicationRecord
 # include AlgoliaSearch

 # algoliasearch do
   # attributes :name
 # end
  has_many :allergies, dependent: :destroy
end
