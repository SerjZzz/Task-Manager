class UserMailer < ApplicationMailer
  def task_created
    @user = params[:user]
    @task = params[:task]

    mail(to: @user.email, subject: 'New Task Created')
  end

  def task_updated
    @user = params[:user]
    @task = params[:task]

    mail(to: @user.email, subject: 'Task Updated')
  end

  def task_destroyed
    @user = params[:user]
    @task = params[:task]

    mail(to: @user.email, subject: 'Task Deleted')
  end

  def password_reset(user)
    @user = user
    @token = user.password_reset_token_digest

    mail(to: @user.email, subject: 'Password Reset')
  end
end
