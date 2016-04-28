class Speaker < ActiveRecord::Base
    has_many :talks
    validates :name, :email, presence: true
end
