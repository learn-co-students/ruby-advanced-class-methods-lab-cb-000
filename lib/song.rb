require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    @song = Song.new
    @song.save
    @song
  end

  def self.new_by_name(song_name)
    song = allocate
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name.include? name}
  end

  def self.find_or_create_by_name(song_name)
    if @@all.detect {|song| song.name.include? song_name}
      @@all.detect {|song| song.name.include? song_name}
    else
      song = Song.new
      song.name = song_name
      song.save
      song
    end
  end

  def self.alphabetical
    @@all.sort_by! { |word| word.name }
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist = array[0]
    song_name = array[1].chomp(".mp3")
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    array = filename.split(" - ")
    artist = array[0]
    song_name = array[1].chomp(".mp3")
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
