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
    #song.name = name
    @@all << song
    song
  end

def self.new_by_name(name)
  song = self.new
  song.name = name
  @@all << song
  song
end

def self.create_by_name(name)
  song = self.new
  song.name = name
  @@all << song
  song
end

def self.find_by_name(name)
  self.all.detect{|song| song.name == name}
end

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
  end



  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    #Separate the filename at the "-" and split into an array of two Objectives
    #[1] is the song name
    #[0] is the artist name
    song.artist_name = (filename.split(" - ")[0])
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    #Separate the filename at the "-" and split into an array of two Objectives
    #[1] is the song name
    #[0] is the artist name
    song.artist_name = (filename.split(" - ")[0])
    @@all << song
    #retain the song in the @@all variable
    song
  end

  def self.destroy_all
    self.all.clear
    #invokes .all, which points to the @@all variable
  end

end
