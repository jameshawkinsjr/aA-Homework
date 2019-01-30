class Toy < ActiveRecord::Base
    TYPES = [
        "string",
        "ball",
        "yarnball",
        "mouse"
    ]

    validates :cat_id, :name, :ttype, presence: true
    validates :ttype, inclusion: TYPES

    belongs_to :cat

end