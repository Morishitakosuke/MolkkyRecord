class Post < ApplicationRecord
  paginates_per 3
  
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }

  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :users
  has_many :notifications, dependent: :destroy
  has_many :tag_post, dependent: :destroy
  has_many :tags, through: :tag_post

  mount_uploader :image, ImageUploader

  # いいね通知
  def create_notification_like!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # コメント通知
  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  # タグ機能
  def save_tag(save_post_tags)
    current_tags = tags.pluck(:name) unless tags.nil?
    old_tags = current_tags - save_post_tags
    new_tags = save_post_tags - current_tags
    old_tags.each do |old|
      tags.delete Tag.find_by(name: old)
    end
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      tags << new_post_tag
    end
  end

  # 検索対象のカラムを設定。入力無しなら全て表示
  def self.search(search)
    if search != ''
      Post.
        where('content LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  # いいね数ランキング
  def self.create_all_ranks
    Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end
end
