class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id, message: "one artist cannot have two works of the same title"}

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shared_viewers,
    through: :views,
    source: :viewer
  
  has_many :views,
    foreign_key: :artwork_id,
    primary_key: :id,
    class_name: :ArtworkShare

end
