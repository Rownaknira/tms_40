class Supervisor::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_course, except: [:index, :new, :create]
  before_action :check_course, only: [:edit, :update, :destroy]
  load_and_authorize_resource except: [:new, :create]

  def index
    @courses = current_user.courses.paginate page: params[:page], per_page: 10
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save!
      flash[:notice] = t "flash_course_created"
      redirect_to [:supervisor, @course]
    else
      render :new
    end
  end

  def show
    @activities = PublicActivity::Activity.order("created_at desc")
      .where trackable_type: "Course", trackable_id: @course.id
  end

  def edit
  end

  def update
    if course_params.has_key? :update_status
      update_status!
      redirect_to supervisor_course_path(@course)
    else
      if @course.update_attributes course_params
        redirect_to supervisor_course_path(@course)
      else
        render :edit
      end
    end
  end

  def destroy
    @course.destroy
    flash[:success] = t ".course_delete"
    redirect_to supervisor_courses_path
  end

  private
  def load_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit :name, :description, :start_date, :end_date,
      :update_status, subject_ids: []
  end

  def update_status!
    if @course.new?
      @course.status = Course::STATUS[:started]
    elsif @course.started?
      @course.status = Course::STATUS[:finished]
    end
    @course.save!
  end

  def check_course
    if (@course.started? && !course_params.has_key?(:update_status)) || @course.finished?
      flash[:danger] = t ".danger"
      redirect_to supervisor_courses_path
    end
  end
end
