class ApplicationMailer < ActionMailer::Base
  default from: Settings.mailer.DEFAULT_NO_REPLY_EMAIL
  layout 'mailer'
end
