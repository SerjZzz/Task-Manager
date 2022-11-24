class ApplicationMailer < ActionMailer::Base
  default from: Rails.env.production? ? ENV['PROD_NO_REPLY_EMAIL'] : ENV['DEV_NO_REPLY_EMAIL']
  layout 'mailer'
end
