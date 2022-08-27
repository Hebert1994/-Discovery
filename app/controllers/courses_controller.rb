class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:index, :show, :upvote, :downvote]
  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = current_admin.courses.build
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = current_admin.courses.build(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: "Curso criado com sucesso." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Editado com sucesso." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Apagado com sucesso" }
      format.json { head :no_content }
    end
  end

  def upvote
    @course = Course.find(params[:id])
    if admin_signed_in? 
      @course.upvote_by current_admin
      redirect_back fallback_location: root_path
    else
      @course.upvote_by current_user
      redirect_back fallback_location: root_path
    end
  end

  def downvote
    @course = Course.find(params[:id])
    if admin_signed_in? 
      @course.downvote_by current_admin
      redirect_back fallback_location: root_path
    else
      @course.downvote_by current_user
      redirect_back fallback_location: root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :description, :module, :video, :thumbnail)
    end
end
