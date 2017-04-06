require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

   def initialize(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new(name)
    new_song

  end

  def self.create_by_name(name)
    new_song = Song.new(name)
    new_song.save
    new_song

  end

  def self.find_by_name(song_name)
    @@all.find {|el| el.name == song_name }

  end

  def self.find_or_create_by_name(song_name)
    if   self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end

  end

  def self.alphabetical

    @@all.sort_by {|el| el.name }

  end

  def self.new_from_filename(filename)
    filenamearray = filename.split(" - ")
    name = filenamearray[1][0..-5]
    artist_name = filenamearray[0]
    new_song = Song.new(name, artist_name)


  end

  def self.create_from_filename(filename)
    filenamearray = filename.split(" - ")
    name = filenamearray[1][0..-5]
    artist_name = filenamearray[0]
    new_song = Song.new(name, artist_name)
    new_song.save
    new_song


  end

  def self.destroy_all
    @@all = []

  end

end
