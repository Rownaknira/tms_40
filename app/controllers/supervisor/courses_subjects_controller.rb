class Supervisor::CoursesSubjectsController < ApplicationController
  def index
    @courses = Course.all
  end

  def edit
    @courses_subject = CoursesSubject.all.find_subjects params[:id]
  end
end
