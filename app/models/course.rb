class Course < ApplicationRecord

  has_attached_file :cover, styles:{medium: "300x300", thumb: "100x100"}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
  
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :number_credits, presence: true, numericality: true



 
end
