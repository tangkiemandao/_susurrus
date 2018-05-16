class MessageMailer < ApplicationMailer
  def send_message(mail)
    @content = mail[:content]
    @email = mail[:email]
    mail(to: ENV['OWNER_GMAIL'], subject: "Susurrus-message from #{mail[:name]}")
  end
end
