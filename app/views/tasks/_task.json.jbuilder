json.extract! task, :id, :name, :description, :deadline, :status, :priority, :labels, :groups, :created_at, :updated_at,
:image
json.url task_url(task, format: :json)
