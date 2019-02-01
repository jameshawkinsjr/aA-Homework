class Track < ApplicationRecord
    validates :title, :ord, :album_id, presence: true
    validates :regular, inclusion: { in: [true, false]}

    belongs_to :album,
        foreign_key: :album_id,
        class_name: :Album

end
