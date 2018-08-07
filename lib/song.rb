
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
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    self.all << song
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    self.all << song
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    found_song = self.new
    flag = true
    self.all.each do |song|
      if(song.name == name)
        found_song = song
        flag = false
      end
    end
    if(flag)
      nil 
    else
      found_song
    end
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    str = filename.split(" - ")
    str[1].slice! ".mp3"
    song = self.new 
    song.artist_name = str[0]
    song.name = str[1]
  end
  
  def self.create_from_filename(filename)
    str = filename.split(" - ")
    str[1].slice! ".mp3"
    song = self.new 
    song.artist_name = str[0]
    song.name = str[1]
    self.all << song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
