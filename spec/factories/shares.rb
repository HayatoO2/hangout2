FactoryBot.define do
  factory :share do
    name              { 'test' }
    log_name                 { Faker::Internet.free_email }
    password              { Faker::Internet.password }
    password_confirmation { password }
  end
end
