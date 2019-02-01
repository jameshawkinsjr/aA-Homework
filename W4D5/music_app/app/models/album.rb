class Album < ApplicationRecord
    validates :title, :year, :band_id, presence: true
    validates :studio, inclusion: { in: [true, false]}

    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band

    has_many :tracks,
        foreign_key: :album_id,
        class_name: :Track

end
