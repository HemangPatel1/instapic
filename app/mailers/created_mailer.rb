class CreatedMailer < ActionMailer::Base
  default from: "no-reply@instapic.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.created_mailer.notify_owner.subject
  #
  def notify_owner(user_email, pic)
    @pic = pic
    mail to: @pic.user.email, subject: 'New Pic!'
  end
end
