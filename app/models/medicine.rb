class Medicine < ApplicationRecord
 # include AlgoliaSearch

 # algoliasearch do
   # attributes :name
 # end

  has_many :compound_mixes
  has_many :substances, through: :compound_mixes
end
