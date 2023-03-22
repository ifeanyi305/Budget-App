class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :transfers

  validates :name, presence: true
  validates :icon, presence: true
  def self.created_by_current_user(current_user)
    where(user_id: current_user.id).order(created_at: :desc)
  end
end
