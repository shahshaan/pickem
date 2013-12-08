# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating teams"

teams = [
  "Chicago Bulls",
  "Miami Heat",
  "New York Knicks",
  "Los Angeles Clippers",
  "Sacramento Kings",
  "Boston Celtics",
  "Detroit Pistons",
  "Dallas Mavericks"
]

teams.each do |team|
  Team.create(name: team)
end


Week.destroy_all

week_start_days = [
  DateTime.new(2013,12,1),
  DateTime.new(2013,12,8),
  DateTime.new(2013,12,15)
]

week_number = 0
week_start_days.each do |week_start_day|
  week_number += 1
  week = Week.new
  week.title = "Week " + week_number.to_s
  week.start_day = week_start_day
  week.save
end

Matchup.destroy_all

puts "Creating Week 1 Games"

matchup = Matchup.new
matchup.team1_id = Team.first.id
matchup.team1_spread = -4
matchup.team2_id = Team.first.id + 1
matchup.team2_spread = 4
matchup.week_id = Week.first.id
matchup.team1_score = 99
matchup.team2_score = 82
matchup.save

matchup = Matchup.new
matchup.team1_id = Team.first.id + 2
matchup.team1_spread = 3.5
matchup.team2_id = Team.first.id + 3
matchup.team2_spread = -3.5
matchup.week_id = Week.first.id
matchup.team1_score = 105
matchup.team2_score = 110
matchup.save



puts "Creating Week 2 Games"

matchup = Matchup.new
matchup.team1_id = Team.first.id + 1
matchup.team1_spread = -3.5
matchup.team2_id = Team.first.id + 5
matchup.team2_spread = 3.5
matchup.week_id = Week.first.id + 1
matchup.start_time = DateTime.new(2013,12,7,19,30,0)
matchup.save

matchup = Matchup.new
matchup.team1_id = Team.first.id + 5
matchup.team1_spread = -3.5
matchup.team2_id = Team.first.id
matchup.team2_spread = 3.5
matchup.week_id = Week.first.id + 1
matchup.start_time = DateTime.new(2013,12,7,19,30,0)
matchup.save

puts "Creating Week 3 Games"

matchup = Matchup.new
matchup.team1_id = Team.first.id + 6
matchup.team1_spread = -3.5
matchup.team2_id = Team.first.id + 2
matchup.team2_spread = 3.5
matchup.week_id = Week.first.id + 2
matchup.start_time = DateTime.new(2013,12,13,19,30,0)
matchup.save

matchup = Matchup.new
matchup.team1_id = Team.first.id + 1
matchup.team1_spread = 1
matchup.team2_id = Team.first.id + 6
matchup.team2_spread = -1
matchup.week_id = Week.first.id + 2
matchup.start_time = DateTime.new(2013,12,14,19,30,0)
matchup.save

puts "Creating users"
User.destroy_all
users = [
  {email: "shahshaan@gmail.com", first_name: "Shaan", last_name: "Shah"},
  {email: "kssaluja@yahoo.com", first_name: "Kulwant", last_name: "Saluja"},
  {email: "larshmatt@yahoo.com", first_name: "Matt", last_name: "Larsh"}
]

users.each do |user|
  User.create!({
    :email => user[:email],
    :first_name => user[:first_name],
    :last_name => user[:last_name],
    :password => "mkspickem", 
    :password_confirmation => "mkspickem"
  })
end

puts "Creating picks"

Pick.destroy_all

User.all.each do |user|
  first_matchup = Matchup.first
  pick = Pick.new
  pick.user_id = user.id
  pick.matchup_id = first_matchup.id
  pick.team_id = [first_matchup.team1_id, first_matchup.team2_id][rand(0..1)]
  pick.save

  second_matchup = Matchup.find(Matchup.first.id + 1)
  pick = Pick.new
  pick.user_id = user.id
  pick.matchup_id = second_matchup.id
  pick.team_id =  [second_matchup.team1_id, second_matchup.team2_id][rand(0..1)]
  pick.save
end






