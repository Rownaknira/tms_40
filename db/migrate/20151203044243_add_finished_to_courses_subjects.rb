class AddFinishedToCoursesSubjects < ActiveRecord::Migration
  def change
    add_column :courses_subjects, :finished, :boolean, default: true
  end
end
