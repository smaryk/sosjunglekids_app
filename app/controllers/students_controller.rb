class StudentsController < ApplicationController

  def new
    @student = Student.new
    
  end

  def create
    @student = current_user.students.build(student_params)
    
    if @student.save
      flash[:success] = "Student created!"
      redirect_to root_url
    else
      
    end
  end

  def destroy

    Student.find(params[:id]).destroy
    flash[:success] = "Student deleted."
    redirect_to users_url  
  end

  def show
    @student = Student.find(params[:id])
  end

  private

   def student_params
    params.require(:student).permit(:first_name, :last_name, :class_code, :address)  
   end

end
