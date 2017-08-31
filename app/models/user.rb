class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :material, presence: true

  ### アソシエーション ###
  has_many :comments, dependent: :destroy
  has_many :article_comments, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :articles_likes, dependent: :destroy
  has_many :records_likes, dependent: :destroy
  has_many :like_articles, through: :articles_likes, source: :articles
  has_many :like_records, through: :records_likes, source: :records


  ### facebookログイン機能 ###
  validates :password, presence: false, on: :facebook_login

  def self.from_omniauth(auth)
      # emailの提供は必須とする
      user = User.where('email = ?', auth.info.email).first
    if user.blank?
      user = User.new
    end
  user.uid   = auth.uid
  user.name  = auth.info.name
  user.email = auth.info.email
  user.icon  = auth.info.image
  user.oauth_token      = auth.credentials.token
  user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  user
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
