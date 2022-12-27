class Comment < ApplicationRecord
  
  belongs_to :article
  scope :titles, -> (x){ where("id>?",x) }
  scope :aa, -> (y){ where("id<?",y) }

end
