class Record < ApplicationRecord
  belongs_to :trick
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :catch, presence: true, numericality: { only_integer: true, less_than: 100000 }
  validates :date, presence: true
end
