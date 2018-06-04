FactoryBot.define do
  factory :task do
    name 'name'
    description 'description'
    deadline Date.today
    status_id 1
    priority 1
    creator_id 1
  end
end
