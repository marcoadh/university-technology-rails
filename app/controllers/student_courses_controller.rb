class StudentCoursesController < ApplicationController

    def create
        course_to_add = Course.find(params[:course_id])
        unless current_user.courses.include?(course_to_add)
            StudentCourse.create(course: course_to_add, student: current_user)
            flash[:notice] = "Felicidades, lograste inscribirte al curso #{course_to_add.name}"
            # Redireccionará a la vista del usuario actual
            redirect_to current_user
        else
            flash[:notice] = "Hubo un error en la inscripción del curso"
            redirect_to root_path
        end
    end
end