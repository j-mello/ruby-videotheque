class Film < ApplicationRecord
    validates_presence_of :title, :description, :director, :duration
    
    belongs_to :genre
    has_many :user
end