require "pry"
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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) != nil
      x = Song.find_by_name(name)
      x
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
  #  binding.pry
    @@all.sort_by{ |x,y| x.name }
  end

  def self.new_from_filename(name)
    #binding.pry
    splitted1 = name.split("-")
    splitted1[1].slice! ".mp3"
    song = Song.new
    song.name = splitted1[1].strip
    song.artist_name = splitted1[0].strip
    song
  end

  def self.create_from_filename(name)
    splitted1 = name.split("-")
    splitted1[1].slice! ".mp3"
    song = Song.new
    song.name = splitted1[1].strip
    song.artist_name = splitted1[0].strip
    song.save
  end

  def self.destroy_all
    @@all = []
  end
end
