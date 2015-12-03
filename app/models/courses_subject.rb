class CoursesSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  scope :find_subjects, ->(course_id) { where(course_id: course_id) }
end
