class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "FollowRelationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "FollowRelationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :active_notifications,  foreign_key: "visitor_id", class_name: "Notification", dependent: :destroy
  has_many :passive_notifications, foreign_key: "visited_id", class_name: "Notification", dependent: :destroy

  validates :username, presence: true, length: { maximum: 12 }
  validates :introduction, length: { maximum: 250 }

  mount_uploader :image, ImageUploader

  # パスワード無しで編集可
  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update(params, *options)
    clean_up_passwords
    result
  end

  # すでにフォロー済みであればtrue返す
  def following?(other_user)
    followings.include?(other_user)
  end

  # ユーザーをフォローする
  def follow(other_user)
    following_relationships.create(following_id: other_user.id)
  end

  # フォローを解除する
  def unfollow(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  # いいねされているか確認
  def already_liked?(post)
    likes.exists?(post_id: post.id)
  end

  # フォロー通知
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  # ゲストユーザーログイン
  def self.guest
    find_or_create_by!(email: "guest@example.com", username: "ゲストユーザー") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
