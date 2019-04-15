class Ratedoctor < ApplicationRecord
  belongs_to :professor, optional: true
  has_one :level, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :level
end
