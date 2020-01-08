class Vendor < ApplicationRecord
  acts_as_paranoid
  validates :title, presence: true
end

