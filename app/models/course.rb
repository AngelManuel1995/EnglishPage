class Course < ApplicationRecord

  has_attached_file :cover, styles:{medium: "300x300", thumb: "100x100"}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
 
  
  #Validations: we'll do the validation in each correspond model for each field of the daba base y it will be with the word validates and we will put the name that we'll validate and the validation example
 
  ##presence validates that the field con't be empty or null
  validates :title, presence: true, length:{minimum:2, maximum:20}, uniqueness: true
  validates :description, presence: true, length: {minumum:20, maximum: 300}
  validates :number_students, presence: true, numericality: {only_integer: true}
  validates :number_credits, presence: true, numericality: true
  

end
