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
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if name == song.name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) unless self.all.include?(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name.downcase}
  end

  def self.new_from_filename(filename)
    song = self.new
    song_data = filename.split("-")
    song_data[1].slice!(".mp3")
    song.name = song_data[1].strip
    song.artist_name = song_data[0].strip
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song_data = filename.split("-")
    song_data[1].slice!(".mp3")
    song.name = song_data[1].strip
    song.artist_name = song_data[0].strip
    self.all << song
  end

  def self.destroy_all
    @@all.clear
  end

end
