class BaseMailer < ActionMailer::Base

  def send_mail(full_name, replyto_email, to_email, subject)
    mail(
          sender: 'noreply@teamtailor.com',
          from: "#{full_name} via TeamTailor <member@teamtailor.com>",
          reply_to: replyto_email,
          to: to_email,
          subject: subject
        )
  end

  def system_mail(to_email, subject)
    mail(sender: 'noreply@teamtailor.com',
          from: 'support@teamtailor.com',
          to: to_email,
          subject: subject)
  end

end
