class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist 
  belongs_to :genre 
  has_many :notes 

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name 
    self.artist ? self.artist.name : nil 
  end
   
  def note_contents=(note_contents)
      note_contents.each do |n| 
      notes.build(content: n)
    end 
  end

  def note_contents
    self.notes.map do |n|
      n.content 
    end 
  end
end
