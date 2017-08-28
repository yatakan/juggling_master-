class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :material, presence: true
  has_many :records
  has_many :comments
  has_many :articles
  has_many :article_comments

  #follow機能
  has_many :follows_f, class_name: 'Follow', foreign_key: :follow_id
  has_many :followings, through: :follows_f, source: 'follow'
  has_many :followers_f, class_name: 'Follow', foreign_key: :followers_id
  has_many :followers, through: :followers_f source: 'follower'
end

has_many :follows_f, class_name: 'Relation', foreign_key: :from_id
  has_many :followings, through: :follows_f, source: 'target'
  has_many :followers_f, class_name: 'Relation', foreign_key: :target_id
  has_many :followers, through: :followers_f, source: 'from'
