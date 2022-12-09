class Web::PasswordResetsController < Web::ApplicationController
  before_action :require_logout, only: [:new, :edit]

  def new
    @password_reset = PasswordResetForm.new
  end

  def create
    @password_reset = PasswordResetForm.new(password_reset_params)
    return render(:new, status: :unprocessable_entity) if @password_reset.invalid?

    user = @password_reset.user

    PasswordResetService.create_token!(user)

    UserMailer.password_reset(user).deliver_now

    redirect_to(:new_session, notice: I18n.t(:email_sent, scope: 'password_reset.notices'))
  end

  def edit
    @password_update = PasswordUpdateForm.new

    redirect_to(:new_session, error: I18n.t(:invalid_or_expired_token, scope: 'password_reset.errors')) if user.blank?
  end

  def update
    @password_update = PasswordUpdateForm.new(password_params)

    return render(:edit, status: :unprocessable_entity) if @password_update.invalid?

    PasswordResetService.update_password!(user, @password_update.password)

    redirect_to(:new_session, success: I18n.t(:password_updated, scope: 'password_reset.successes'))
  end

  private

  def password_reset_params
    params.require(:password_reset_form).permit(:email)
  end

  def password_params
    params.require(:password_update_form).permit(:password, :password_confirmation, token: params[:token])
  end

  def user
    @user ||= PasswordResetService.find_user_by_token(params[:token])
  end

  def require_logout
    return redirect_to(:board, warning: I18n.t(:already_signed, scope: 'password_reset.warnings')) if signed_in?
  end
end
