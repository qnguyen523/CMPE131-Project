json.array!(@steps) do |step|
  json.extract! step, :id, :requirement, :completionTime
  json.url step_url(step, format: :json)
end
