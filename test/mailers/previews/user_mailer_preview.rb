# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def task_created
    user = User.first
    task = Task.first
    params = { user: user, task: task }

    UserMailer.with(params).task_created
  end

  def task_updated
    user = User.first
    task = Task.first
    params = { user: user, task: task }

    UserMailer.with(params).task_updated
  end

  def task_destroyed
    user = User.first
    task = Task.first
    params = { user: user, task: task }

    UserMailer.with(params).task_destroyed
  end

  def password_reset
    user = User.first
    PasswordResetService.create_token!(user)
    token = user.password_reset_token_digest
    params = { user: user, token: token }

    UserMailer.with(params).password_reset(user)
  end
end
