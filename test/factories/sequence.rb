FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :avatar, :name, :description] do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "person#{n}@gmail.com"
  end

  sequence :state, [:new_task, :in_development, :in_qa, :in_code_review, :ready_for_release, :released, :archived].cycle

  sequence :expired_at do |n|
    Time.now + (60 * 60 * 24 * n)
  end
end
