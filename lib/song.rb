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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|p| p.name}
  end

  def self.new_by_name_and_artist(song_name, art_name)
    song = self.new
    song.name = song_name
    song.artist_name = art_name
    song
  end

  def self.create_by_name_and_artist(song_name, art_name)
    song = self.new_by_name_and_artist(song_name, art_name)
    self.all << song
    song
  end

  def self.new_from_filename(fname)
    art_name, song_name = fname.split('.').first.split('-').collect {|w| w.strip}
    self.new_by_name_and_artist(song_name, art_name)
  end

  def self.create_from_filename(fname)
    song = self.new_from_filename(fname)
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
