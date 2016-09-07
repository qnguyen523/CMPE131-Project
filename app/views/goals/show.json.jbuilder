json.extract! @goal, :id, :Goal, :Description, :Date, :DueDate, :created_at, :updated_at
json.extract! @step, :id, :requirement, :completionTime, :created_at, :updated_at