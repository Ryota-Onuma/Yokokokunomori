class Professor < ApplicationRecord
 has_many :ratedoctors
 accepts_nested_attributes_for :ratedoctors
 end
