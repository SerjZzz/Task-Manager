require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'task created' do
    user = create(:user)
    task = create(:task, author: user)

    params = { user: user, task: task }
    email = UserMailer.with(params).task_created

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [Settings.mailer.DEFAULT_NO_REPLY_EMAIL], email.from
    assert_equal [user.email], email.to
    assert_equal 'New Task Created | TaskManager Project', email.subject
    assert email.body.to_s.include?("Task-##{task.id} was created."), 'The email body does not include expected text'
  end

  test 'task updated' do
    user = create(:user)
    task = create(:task, author: user)

    params = { user: user, task: task }
    email = UserMailer.with(params).task_updated

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [Settings.mailer.DEFAULT_NO_REPLY_EMAIL], email.from
    assert_equal [user.email], email.to
    assert_equal 'Task Updated | TaskManager Project', email.subject
    assert email.body.to_s.include?("Task-##{task.id} was updated."), 'The email body does not include expected text'
  end

  test 'task destroyed' do
    user = create(:user)
    task = create(:task, author: user)
    task.destroy

    params = { user: user, task: task }
    email = UserMailer.with(params).task_destroyed

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [Settings.mailer.DEFAULT_NO_REPLY_EMAIL], email.from
    assert_equal [user.email], email.to
    assert_equal 'Task Deleted | TaskManager Project', email.subject
    assert email.body.to_s.include?("Task-##{task.id} was deleted."), 'The email body does not include expected text'
  end

  test 'password reset' do
    user = create(:user)
    PasswordResetService.create_token!(user)
    token = user.password_reset_token_digest

    params = { user: user, token: token }
    email = UserMailer.with(params).password_reset(user)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [Settings.mailer.DEFAULT_NO_REPLY_EMAIL], email.from
    assert_equal [user.email], email.to
    assert_equal 'Password Reset | TaskManager Project', email.subject
  end
end
