module NotificationsHelper
  def notification_form(notification)
    # 通知を送ってきたユーザーを取得
    @visitor = notification.visitor
    # #コメントの内容を通知に表示する
    @comment = nil
    @visitor_comment = notification.comment_id
    # notification.actionがfollowかlikeかcommentかで処理を変える
    case notification.action
    when 'follow'
      # aタグで通知を作成したユーザーshowのリンクを作成
      tag.a(notification.visitor.username, href: user_path(@visitor)) + 'があなたをフォローしました'
    when 'like'
      tag.a(notification.visitor.username, href: user_path(@visitor)) + 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id)) + 'にいいねしました'
    when 'comment'
      # コメントの内容と投稿のタイトルを取得
      @comment = Comment.find_by(id: @visitor_comment)
      tag.a(@visitor.username, href: user_path(@visitor)) + 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id)) + 'にコメントしました'
    end
  end
end
