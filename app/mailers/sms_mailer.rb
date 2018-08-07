class SmsMailer < ApplicationMailer
  default from: "from@example.com"

  def sms_email(admin)
    @admin = admin
    mail(to: @admin.smsmail, subject: 'Sample Email')
  end
end
