class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id, 
    message: "can't be assigned more than once to the same viewer" }

  belongs_to :artwork,
  foreign_key: :artwork_id,
  class_name: :Artwork

  belongs_to :viewer,
  foreign_key: :viewer_id,
  class_name: :User
end