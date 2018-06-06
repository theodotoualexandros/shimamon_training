FactoryBot.define do
  factory :user do
    email 'test@user.com'
    password 'topsecret'
    group_ids Group.all.ids
  end
end
