require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
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
    song = new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    song = create_by_name(name) if song.nil?
    song
  end

  def self.alphabetical
    sorted = @@all.sort_by! do |song|
      song.name
    end
    sorted
  end

  def self.new_from_filename(file_name)
    array = file_name.split(" - ")
    name = array[1].slice(0..array[1].length - 5)
    song = new_by_name(name)
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(file_name)
    song = new_from_filename(file_name)
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

end
