class UsersSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :courses_subject
end
