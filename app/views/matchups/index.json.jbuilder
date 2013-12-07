json.array!(@matchups) do |matchup|
  json.extract! matchup, :id, :team1_name, :team2_name, :team1_spread, :team2_spread, :start_time, :team1_score, :team2_score, :week
  json.url matchup_url(matchup, format: :json)
end
