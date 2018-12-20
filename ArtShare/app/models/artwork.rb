class Artwork < ApplicationRecord
  validates :title, :artist_id, presence: true
  validates :image_url, uniqueness: true
  validates :title, uniqueness: { scope: :artist_id, 
    message: 'must be unique for each artist' }

  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: :User

  has_many :artwork_shares,
  foreign_key: :artwork_id,
  class_name: :ArtworkShare

  has_many :shared_viewers,
  through: :art_shares,
  source: :viewer

  private

  def self.artworks_for_user_id
    Artwork
    .left_outer_joins(:artwork_shares)
    .where('(artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
    .distinct
  end
end