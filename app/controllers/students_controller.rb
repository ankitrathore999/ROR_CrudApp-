class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
     
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    
    if @student.update(student_params)
      flash[:notice]= 'product update'
    redirect_to root_path
    else
      flash[:error] = 'Failed to update'
      render :edit
    end
  end

  def new
    @student = Student.new
  end

  def create
    student =Student.new(student_params)
    if student.save
      flash[:notice] ='product add!'
     redirect_to root_path
    else
      flash[:error] ='failed to product!'
      render :new
    end
  end

  def destroy   
    @student = Student.find(params[:id])   
    if @student.delete   
      flash[:notice] = 'student deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this student'   
      render :destroy   
    end   
  end   
  
  private
  def student_params
    params.require(:student).permit(:name, :age)
  end
end
