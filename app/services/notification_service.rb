class NotificationService
  # recipient 接收者
  # actor 发起者
  # notifiable  哪张表发起的  比如，question要提醒用户，这里就传question
  def initialize(recipient, actor, notifiable)
    @recipient = recipient
    @actor = actor
    @notifiable = notifiable
  end

  # 发送信息
  def send_notification!
    Notification.create(recipient: @recipient, actor: @actor, action: "notify_message", notifiable: @notifiable)
  end

  # 发送信息
end
