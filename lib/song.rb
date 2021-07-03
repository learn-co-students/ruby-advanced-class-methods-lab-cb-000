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
    song = Song.new 
    self.all << song 
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name 
    song
  end
  
  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    song.nil? ? self.create_by_name(name):song
  end
  
  def self.alphabetical
    songs = self.all.sort do |a, b|
      a.name <=> b.name
    end
    songs
  end
  
  def self.new_from_filename(filename)
     artist_name, name = filename.split('-')
     name = name.gsub(/.mp3/, "").strip
     song = self.new_by_name(name)
     song.artist_name = artist_name.strip
     song
  end
  
  def self.create_from_filename(filename)
     artist_name, name = filename.split('-')
     name = name.gsub(/.mp3/, "").strip
     song = self.create_by_name(name)
     song.artist_name = artist_name.strip
     song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end

