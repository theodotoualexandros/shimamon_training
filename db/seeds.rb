# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Group.create!([
  { name: 'group 1' },
  { name: 'group 2' },
  { name: 'group 3' },
  { name: 'group 4' }
])

Status.create!([
  { name: 'not_started' },
  { name: 'started' },
  { name: 'finished' }])

NotificationType.create!([
  { name: 'deadline_approaching', msg: 'Deadline approaching' },
  { name: 'deadline_past', msg:'Deadline past' }])

groups = Group.all.ids

User.create!(email: 'alex@gmail.com',
            password: 'topsecret',
            group_ids: groups,
            admin_flg: true)
User.create!(email: 'random@gmail.com',
            password: 'topsecret',
            group_ids: groups,
            admin_flg: true)

(1..10).each do |i|
  Label.create!(name: "Label #{i}")
end

labels = Label.all.ids

(1..100).each do |i|
  Task.create!(name: "Task #{i}",
              description: "description",
              deadline: Date.today,
              status_id: 1,
              creator_id: 1 + rand(2),
              label_ids: labels,
              group_ids: groups,
              priority: 1)
end

