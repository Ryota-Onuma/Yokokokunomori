class Lecture < ApplicationRecord
  has_many :ratelessons
  accepts_nested_attributes_for :ratelessons
end
