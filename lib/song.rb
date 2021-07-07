require 'pry'
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
    new_song = self.new
    new_song.name = name
    self.all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|object| object.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) != nil ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|object| object.name}
  end

  def self.new_from_filename(filename)
    filename_splitted = filename.split(/\ -\ |\./)
    artist = filename_splitted[0]
    song_name = filename_splitted[1]
    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end
end
#binding.pry
