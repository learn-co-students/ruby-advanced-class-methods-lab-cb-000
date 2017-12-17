require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    @@all << song
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    @@all.select { |song| song.name == name }.first
  end

  def self.find_or_create_by_name(name)
    return find_by_name(name) unless find_by_name(name) == nil
    create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name.downcase }
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1].chomp(".mp3")
    song = new_by_name(name)
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
