## supervisors
 User.create!(first_name: "test",
              last_name: "test",
              email: "test@test.com",
              password: "password",
              supervisor: true)
 User.create!(first_name: "test1",
              last_name: "test1",
              email: "test1@test.com",
              password: "password",
              supervisor: true)
## trainees
99.times do |n|
  first_name = Faker::Name.first_name
  last_name =  Faker::Name.last_name
  email = "example-#{n+1}@test.com"
  password = "password"
  User.create!(first_name:  first_name,
               last_name: last_name,
               email: email,
               password: password)
end
## course
10.times do |n|
  name = Faker::Name.name
  description = "description#{n+1}"
  Course.create!(name: name,
                 description: description)
end
##subject
10.times do |n|
  name = Faker::Name.name
  description = "description for subject#{n+1}"
  Subject.create!(name: name,
                  description: description)
end
##course_subj
10.times do |n|
  cid = "#{n+1}"
  sid = "#{n+1}"
  CoursesSubject.create!(course_id: cid,
                         subject_id: sid)
end
