json.extract! task, :id, :name, :description, :deadline, :created_at, :updated_at
json.url task_url(task, format: :json)
