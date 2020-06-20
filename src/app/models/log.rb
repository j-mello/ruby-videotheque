class Log < ApplicationRecord
    validates_presence_of :dateEmprunt, :dateRetour, :etat

    belongs_to :user
    belongs_to :user_id1, :class_name => 'User', :foreign_key => 'user_id1'
    belongs_to :user_id2, :class_name => 'User', :foreign_key => 'user_id2'
end
