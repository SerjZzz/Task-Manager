class Web::ApplicationController < ApplicationController
  add_flash_types :success, :warning, :error, :notice

  private

  def require_logout
    return redirect_to(:board, warning: I18n.t(:already_signed, scope: 'warnings.messages')) if signed_in?
  end
end
