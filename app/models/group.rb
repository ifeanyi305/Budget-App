class Group < ApplicationRecord
  belongs_to :user
  belongs_to :transfer

  validates :name, presence: true
  validates :icon, presence: true
end
