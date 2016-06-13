class UserMailer < ApplicationMailer
	default from: "at.demsas@gmail"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'at.demsas@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
end
