class Log < ApplicationRecord
    validates_presence_of :etat

    belongs_to :film
    belongs_to :user, :class_name => 'User', :foreign_key => 'user_id1'
    belongs_to :user, :class_name => 'User', :foreign_key => 'user_id2'
end
