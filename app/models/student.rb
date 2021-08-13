class Student < ApplicationRecord
    has_many :comments
    has_many :votes

    def self.from_omniauth(auth)
        # Creates a new student only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |student|
          student.name = auth.info.name
          student.email = auth.info.email
        end
    end

end
