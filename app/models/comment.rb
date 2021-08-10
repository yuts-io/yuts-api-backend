class Comment < ApplicationRecord
    belongs_to :course
    has_many :votes, dependent: :destroy
end
