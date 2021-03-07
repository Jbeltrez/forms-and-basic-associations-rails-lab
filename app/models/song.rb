class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist 
  belongs_to :genre 
  has_many :notes 

  def song_artist_name=(song_artist_name)
    self.artist = Artist.find_or_create_by(name: song_artist_name)
    
  end

  # def song_artist_name
  #   self.artist ? self.artist.name : nil 
  # end
end
