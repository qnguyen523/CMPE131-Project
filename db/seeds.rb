# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create! name: 'jeremy', email: 'jeremy@jeremy.com', password: 'password', password_confirmation: 'password'
goal = Goal.create! Goal: 'test',  Description: 'test', Date: '2016-04-26', DueDate: '2016-04-26', user_id: user.id
step = Step.create! requirement: 'step 1 @goal 1 @user', goal_id: goal.id
