class Comment < ApplicationRecord
  belongs_to :record
  belongs_to :user
end
