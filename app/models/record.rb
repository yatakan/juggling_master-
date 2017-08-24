class Record < ApplicationRecord
  belongs_to :trick
  belongs_to :user
  belongs_to :category
end
