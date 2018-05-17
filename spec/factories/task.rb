FactoryBot.define do
  factory :task do
    name 'name'
    description 'description'
    deadline Date.today
  end
end
