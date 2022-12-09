require 'test_helper'

class Web::PasswordResetsControllerTest < ActionController::TestCase
  setup do
    ActionMailer::Base.deliveries.clear
  end

  test 'should get new' do
    get :new
    assert_response :success
    assert_predicate flash[:warning], :nil?
  end

  test 'should redirect when already signed in' do
    user = create(:user)
    sign_in(user)
    get :new
    assert_response :redirect
    assert_equal flash[:warning], I18n.t(:already_signed, scope: 'password_reset.warnings')
  end

  test 'should post create' do
    user = create(:user)
    assert_emails 1 do
      post :create, params: { password_reset_form: { email: user.email } }
    end
    assert_response :redirect
    assert_predicate flash[:alert], :nil?
  end

  test 'should get edit' do
    user = create(:user)
    PasswordResetService.create_token!(user)
    token = user.password_reset_token_digest
    get :edit, params: { token: token }
    assert_response :success
  end

  test 'token should be expired within the specified lifetime' do
    user = create(:user)
    PasswordResetService.create_token!(user)
    token = user.password_reset_token_digest

    sleep Settings.password_reset.TOKEN_EXPIRATION_TIME

    get :edit, params: { token: token }
    assert_response :redirect
    assert_equal flash[:error], I18n.t(:invalid_or_expired_token, scope: 'password_reset.errors')
  end

  test 'only last generated token should be valid' do
    user = create(:user)
    PasswordResetService.create_token!(user)
    first_token = user.password_reset_token_digest

    PasswordResetService.create_token!(user)
    last_token = user.password_reset_token_digest

    get :edit, params: { token: first_token }
    assert_response :redirect
    assert_equal flash[:error], I18n.t(:invalid_or_expired_token, scope: 'password_reset.errors')

    get :edit, params: { token: last_token }
    assert_response :success
  end

  test 'should patch update' do
    user = create(:user)
    PasswordResetService.create_token!(user)

    token = user.password_reset_token_digest
    new_password = generate(:password)
    reset_attrs = { password: new_password, password_confirmation: new_password }

    patch :update, params: { token: token, password_update_form: reset_attrs }
    assert_response :redirect
    assert_equal flash[:success], I18n.t(:password_updated, scope: 'password_reset.successes')
  end
end
