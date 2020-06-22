class Film < ApplicationRecord
  validates_presence_of :title, :description, :director

  belongs_to :genre
  belongs_to :user, :foreign_key => 'user_id'
end
