require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

#instantiates and saves the song, and it returns the new song that was created
  def self.create
    song = self.new
    song.save
    song
  end
#instantiates a song with a name property
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
#instantiates and saves a song with a name property
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
#can find a song present in @@all by name
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end
#invokes .find_by_name and .create_by_name instead of repeating code
#returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create_by_name(name)
  end
#returns all the song instances in alphabetical order by song name
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
#initializes a song and artist_name based on the filename format
  def self.new_from_filename(filename)
    row = filename
    data = row.split(" - ")
    artist_name = data[0]
    song_name = data[1].gsub(".mp3", "")

      song = self.new
      song.name = song_name
      song.artist_name = artist_name
      song
  end
#initializes and saves a song and artist_name based on the filename format
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
#clears all the song instances from the @@all array
  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


end
