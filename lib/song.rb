class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)  || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
  ##  song_info = filename.split(" - ") ##splitting the filename into an array
  ##  artist = song_info[0] ##accessing first entry of array
  ##  song_name = song_info[1]
  ##  song_name_trim = song_name[0...-4] ##trims the last 4 parts ofthe song name off
  ##  song = self.create_by_name(song_name_trim)
  artist = file.split(" - ")[0]
  name = file.split(" - ")[1].split(".mp3")[0]
  song = self.new_by_name(name)
  song.artist_name = artist
  song
  end

  def self.create_from_filename(file)  ##just a constructor for the option we made above
    artist = file.split(" - ")[0]
     name = file.split(" - ")[1].split(".mp3")[0]
     song = self.create_by_name(name)
     song.artist_name = artist
     song
end

def self.destroy_all
  self.all.clear
end

end
