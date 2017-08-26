class Article < ApplicationRecord
  has_many :article_comments
  belongs_to :user
end
