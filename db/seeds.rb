# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Status.create!([
  { name: 'not_started' },
  { name: 'started' },
  { name: 'finished' }])

User.create!(email: 'alex@gmail.com',
            password: 'topsecret',
            admin_flg: true)
User.create!(email: 'random@gmail.com',
            password: 'topsecret',
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
              user_id: 1 + rand(2),
              label_ids: labels,
              priority: 1)
end

