class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort { |x, y| x.name <=> y.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(" - ").first
    song.name = filename.split(" - ").last.chomp(".mp3")
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(" - ").first
    song.name = filename.split(" - ").last.chomp(".mp3")
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
