json.array! @notifications do |notification|
  json.notification_type = notification.notification_type
  json.task = notification.task
  json.url = task_path(notification.task)
end
