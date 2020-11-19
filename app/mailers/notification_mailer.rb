class NotificationMailer < ApplicationMailer
  default from: "taaachezi@gmail.com"

  def send_mail(user)
    @user = user
    mail(subject: "登録が完了しました", to: @user.email)
  end
end
