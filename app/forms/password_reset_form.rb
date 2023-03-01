class PasswordResetForm
  include ActiveModel::Model

  attr_accessor :email

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :user_present?

  def user
    @user ||= User.find_by(email: email)
  end

  private

  def user_present?
    errors.add(:email, :email_not_found) if user.blank?
  end
end
