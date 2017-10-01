class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true

  ### アソシエーション ###
  has_many :comments, dependent: :destroy
  has_many :article_comments, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :articles_likes, dependent: :destroy
  has_many :records_likes, dependent: :destroy
  has_many :like_articles, through: :articles_likes, source: :articles
  has_many :like_records, through: :records_likes, source: :records

  ### コントローラから移動 ###
  def catch_sum(records)
    number = 0
    records.each do |record|
      number += record.catch
    end
    return number
  end

  ### フォロー機能 ###
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

end
