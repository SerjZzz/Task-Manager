module PasswordResetService
  class << self
    def create_token!(user)
      token = user.signed_id(
        expires_in: Settings.password_reset.TOKEN_EXPIRATION_TIME,
        purpose: :password_reset,
      )

      user.update!(password_reset_token_digest: token)
    end

    def find_user_by_token(token)
      user = User.find_signed(token, purpose: :password_reset)

      return if user.blank? || token_invalid?(user, token)

      user.presence
    end

    def update_password!(user, password)
      user.update!(password_reset_token_digest: nil, password: password)
    end

    private

    def token_invalid?(user, token)
      return true if user.password_reset_token_digest.blank? || token != user.password_reset_token_digest
    end
  end
end
