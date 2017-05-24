class Article < ApplicationRecord

 
  ##These validations tha we done are to application level and we indicates that each field must be presence when have a new register
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  #validates :vistis_count, numericality: true
  belongs_to :user
end
