class AddColsToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :classnotes, :text
    add_column :courses, :course_code, :string
    add_column :courses, :credits, :float
    add_column :courses, :crn, :integer
    add_column :courses, :description, :text
    add_column :courses, :enrolled, :integer
    add_column :courses, :extra_info, :string
    add_column :courses, :final_exam, :string
    add_column :courses, :flag_info, :string
    add_column :courses, :fysem, :bool
    add_column :courses, :last_enrollment, :integer
    add_column :courses, :last_enrollment_same_professors, :bool
    add_column :courses, :listing_id, :integer
    add_column :courses, :locations_summary, :string
    add_column :courses, :number, :string
    add_column :courses, :professor_names, :string
    add_column :courses, :regnotes, :text
    add_column :courses, :requirements, :text
    add_column :courses, :rp_attr, :text
    add_column :courses, :school, :string
    add_column :courses, :season_code, :integer
    add_column :courses, :section, :integer
    add_column :courses, :skills, :string
    add_column :courses, :subject, :string
    add_column :courses, :syllabus_url, :string
    add_column :courses, :times_summary, :string
    add_column :courses, :title, :string
    add_column :courses, :gut_index, :float
    add_column :courses, :gut_percentile, :integer
    add_column :courses, :professor_percentile, :integer
    add_column :courses, :workload_percentile, :integer
    add_column :courses, :same_professor_total_rating_percentile, :integer
    add_column :courses, :same_professor_workload_percentile, :integer
    add_column :courses, :gut_percentile_subject, :integer
    add_column :courses, :professor_percentile_subject, :integer
    add_column :courses, :workload_percentile_subject, :integer
    add_column :courses, :same_professor_total_rating_percentile_subject, :integer
    add_column :courses, :same_professor_workload_percentile_subject, :integer
    add_column :courses, :gut_index_mean, :float
    add_column :courses, :gut_index_median, :float
    add_column :courses, :gut_index_variance, :float
    add_column :courses, :gut_index_standard_deviation, :float
    add_column :courses, :gut_index_mode, :float
    add_column :courses, :gut_index_range, :float


  end
end
