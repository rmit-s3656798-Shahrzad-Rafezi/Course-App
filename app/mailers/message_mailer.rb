class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_me.subject
  #
  def contact_me(message)
    @greeting = "Hi courseApp creator!"
    @body = message.body
    mail to: "s3657505@student.rmit.edu.au"
  end
end
