class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!, :authorize

  def authorize
    render(file: Rails.root.join(Rails.root, 'public/403.html'), status: :forbidden, layout: false) if forbidden?
  end

  def forbidden?
    !current_user.is_a?(Admin)
  end
end
