# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'

admin = Admin.find_or_create_by(first_name: 'admin', last_name: 'admin', email: 'admin@gmail.com')
admin.password = 'admin111'
admin.save

12.times do
  user = [Manager, Developer].sample.new
  user.email = Faker::Internet.unique.email
  user.first_name = Faker::Name.unique.first_name
  user.last_name = Faker::Name.unique.last_name
  user.password = Faker::Internet.password
  user.save

  8.times do
    task = FactoryBot.create(
      :task,
      name: Faker::ProgrammingLanguage.creator,
      description: Faker::Hacker.say_something_smart,
      assignee: user,
      author: user,
      created_at: Faker::Date.between(from: 2.days.ago, to: Date.today),
      updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
      expired_at: Faker::Date.forward(days: 5),
      state: [:new_task, :in_qa, :in_code_review, :in_development, :ready_for_release, :released, :archived].sample
    )
  end
end
