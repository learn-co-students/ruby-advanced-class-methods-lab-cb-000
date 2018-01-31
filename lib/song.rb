class Song
  attr_accessor :name, :artist_name
  @@all = []

  #def initialize(name, artist_name)
  #  self.name = name
  #  self.artist_name = artist_name
  #end

  def self.create
    song = Song.new
    song.save
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
    song.save
    song
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end

  def self.new_from_filename(filename)
    artist, song_name = filename.split(' - ')
    song = Song.new
    song.artist_name = artist
    song.name = song_name[0..-5]
    song
  end

  def self.create_from_filename(filename)
    artist, song_name = filename.split(' - ')
    song = Song.new
    song.artist_name = artist
    song.name = song_name[0..-5]
    song.save
    song
  end

  def self.destroy_all
    all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    all.detect { |song| song.name == name }
  end

  def self.alphabetical
    all.sort { |a, b| a.name <=> b.name }
  end
end
