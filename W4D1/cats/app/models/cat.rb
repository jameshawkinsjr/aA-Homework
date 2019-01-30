class Cat < ActiveRecord::Base
    validates :name, :skill, presence: true

    has_many :toys
end