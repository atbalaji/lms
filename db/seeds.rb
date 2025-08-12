# Clear old data
Enrollment.delete_all
Lesson.delete_all
Course.delete_all
User.delete_all

# Create Users
admin = User.create!(email: "admin@example.com", password: "password", role: "admin")
instructor1 = User.create!(email: "instructor1@example.com", password: "password", role: "instructor")
instructor2 = User.create!(email: "instructor2@example.com", password: "password", role: "instructor")
student1 = User.create!(email: "student1@example.com", password: "password", role: "student")
student2 = User.create!(email: "student2@example.com", password: "password", role: "student")

# Create Courses owned by instructors
course1 = Course.create!(title: "Ruby on Rails Basics", description: "Learn the fundamentals of Rails", user: instructor1)
course2 = Course.create!(title: "Advanced Rails", description: "Deep dive into Rails internals", user: instructor2)

# Add Lessons to each course
lesson1 = Lesson.create!(title: "Intro to Rails", content: "Rails MVC overview", course: course1)
lesson2 = Lesson.create!(title: "ActiveRecord Basics", content: "Models and DB", course: course1)

lesson3 = Lesson.create!(title: "Rails Internals", content: "Request cycle", course: course2)
lesson4 = Lesson.create!(title: "Performance Tuning", content: "Caching, N+1", course: course2)

# Enroll students in courses
Enrollment.create!(user: student1, course: course1)
Enrollment.create!(user: student1, course: course2)
Enrollment.create!(user: student2, course: course1)

puts "✅ Seeded:"
puts "- Admin: #{admin.email}"
puts "- Instructors: #{instructor1.email}, #{instructor2.email}"
puts "- Students: #{student1.email}, #{student2.email}"
puts "- Courses: #{Course.count}"
puts "- Lessons: #{Lesson.count}"
puts "- Enrollments: #{Enrollment.count}"
