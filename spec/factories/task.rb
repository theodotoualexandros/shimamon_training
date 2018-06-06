FactoryBot.define do
  factory :task do
    name 'name'
    description 'description'
    deadline Date.today
    status_id 1
    priority 1
    creator_id 1
    group_ids Group.all.ids
  end
end
