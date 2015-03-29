# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
         {username: 'luyen.vu', first_name: 'Luyen', last_name: 'Vu', email: 'luyen.vu@teamtailor.com'},
         {username: 'an.nguyen', first_name: 'An', last_name: 'Nguyen', email: 'an.nguyen@teamtailor.com'},
         {username: 'lee.tran', first_name: 'Lee', last_name: 'Tran', email: 'lee.tran@teamtailor.com'}
        ]
users.each do |u|
  u1 = User.new
  u1.username = u[:username]
  u1.first_name = u[:first_name]
  u1.last_name = u[:last_name]
  u1.email = u[:email]
  u1.password = u[:username]
  u1.save!
  setting = UserSetting.new
  setting.user = u1
  setting.save!
end

candidates = [
              {first_name: 'Candidate1', last_name: 'Rooney', skill: 'football'},
              {first_name: 'Candidate2', last_name: 'Choi', skill: 'badminton'}
             ]
candidates.each do |d|
  d1 = Candidate.new
  d1.first_name = d[:first_name]
  d1.last_name = d[:last_name]
  d1.email = d[:email]
  d1.save!
end

lee = User.find_by_username 'lee.tran'
lee.user_setting.metion_setting = 1
lee.user_setting.save!

