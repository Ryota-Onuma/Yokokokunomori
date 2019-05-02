class Ratedoctor < ApplicationRecord
  belongs_to :professor, optional: true
  has_many :levels, dependent: :destroy
  accepts_nested_attributes_for :levels
end
