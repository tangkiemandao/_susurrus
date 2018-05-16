class MessageMailer < ApplicationMailer
  def send_message(mail)
    @content = mail[:content]
    @email = mail[:email]
    mail(to: "kien.arch92@gmail.com", subject: "Susurrus-message from #{mail[:name]}", from: @email)
  end
end
