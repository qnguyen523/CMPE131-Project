json.array!(@to_dos) do |to_do|
  json.extract! to_do, :id, :task, :description, :time
  json.url to_do_url(to_do, format: :json)
end

json.array!(@goals) do |goal|
  json.extract! goal, :id, :Goal, :Description, :Date, :DueDate, :user_id
  json.url goal_url(goal, format: :json)
end
