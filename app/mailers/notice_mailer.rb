class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_instagram.subject
  #

  def sendmail_instagram(instagram)
    @instagram = instagram

    mail to: "toshiaki.ikeda.study@gmail.com",
         subject: '【Achieve】画像が投稿されました'
  end

end
