class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new(name)
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    song ? song : Song.create_by_name(name)
  end

  def self.alphabetical
    Song.all.sort do |a, b|
      a.name <=> b.name
    end
  end

  def self.new_from_filename(filename)
    song_data = filename.slice(0, filename.length - 4).split(" - ")
    artist = song_data[0]
    name = song_data[1]
    song = new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    all.clear
  end
end
