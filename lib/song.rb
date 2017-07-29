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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.detect { | song | song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song == nil ? self.create_by_name(name) : song
  end

  def self.alphabetical
    self.all.sort_by { | song | song.name }
  end

  def self.new_from_filename(filename)
    filename.slice!(/\.mp3/)
    name_array = filename.split(" - ")
    new_name = name_array[1]
    song = self.new_by_name(new_name)
    song.artist_name = name_array[0]
    song
  end

  def self.create_from_filename(filename)
    filename.slice!(/\.mp3/)
    name_array = filename.split(" - ")
    new_name = name_array[1]
    song = self.create_by_name(new_name)
    song.artist_name = name_array[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
