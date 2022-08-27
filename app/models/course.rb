class Course < ApplicationRecord
    belongs_to :admin 
    acts_as_votable
    has_many :comments
    has_one_attached :video
    has_one_attached :thumbnail
end
