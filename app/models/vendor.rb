class Vendor < ApplicationRecord
  acts_as_paranoid
  validates :title, presence: true

  scope :available, -> { where(online: true) }
end

