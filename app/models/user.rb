class User < ApplicationRecord
  has_many :transfers, foreign_key: 'author_id'
  has_many :groups

  validates :name, presence: true
end
