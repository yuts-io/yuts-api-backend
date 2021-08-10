class Comment < ApplicationRecord
    belongs_to :course
    has_many :votes, dependent: :destroy

    def get_student_name()
         

        student_wanted = Student.all.find{ |student| student.id == self.student_id }

        student_wanted.first_name + " " + student_wanted.last_name
    end

end
