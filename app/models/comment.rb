class Comment < ApplicationRecord
  belongs_to :record
  belongs_to :user

  validates :text, presence: true, length: { maximum: 1000 }
end
