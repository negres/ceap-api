class ImportFileMailer < ApplicationMailer
  def created_data(email)
    mail(to: email, subject: 'Os dados foram criados!')
  end
end
