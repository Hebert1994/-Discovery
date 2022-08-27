json.extract! course, :id, :title, :description, :module, :created_at, :updated_at
json.url course_url(course, format: :json)
