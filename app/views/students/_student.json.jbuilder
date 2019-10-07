json.extract! student, :id, :name, :email, :password, :education_level, :university, :max_books, :created_at, :updated_at
json.url student_url(student, format: :json)