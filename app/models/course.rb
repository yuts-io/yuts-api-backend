class Course < ApplicationRecord

    def self.getBySeason(season)
        self.order(season_code: :desc).select {|course| course.season_code == season}
    end
end
