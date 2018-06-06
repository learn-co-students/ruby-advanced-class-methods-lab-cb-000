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

  def self.find_by_name(name)
      self.all.each {|song|
      if song.name == name
        return song
    end}
    return nil
  end

  def self.find_or_create_by_name(name)
      track = self.find_by_name(name)
      track == nil ? self.create_by_name(name) : track
  end

  def self.alphabetical
      self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
      track = file.split(/[\.-]/)
      artist = track[0].strip
      name = track[1].strip
      song = self.create_by_name(name)
      song.artist_name = artist
      return song
  end

  def self.create_from_filename(file)
      song = self.new_from_filename(file)
      song.save
  end

  def self.destroy_all
      self.all.clear
  end

end
