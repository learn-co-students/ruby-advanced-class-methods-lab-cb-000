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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song

  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    # song.save
    song
  end

  def self.find_by_name(song_name)
    # @@all.detect { |song| song.name == name  }
    self.all.detect{|s| s.name == song_name}

  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #    self.find_by_name(name)
    # else
    #    self.create_by_name(name)

       self.find_by_name(name) || self.create_by_name(name)

end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(song_name)
    file = song_name.split(/( - |\.)/)
    # song_name_split = file[2]
    # artist_name_split = file[0]
    new_song = Song.new
    new_song.name = file[2]
    new_song.artist_name = file[0]
    new_song
    # binding.pry
  end

  #
  def self.create_from_filename(filename)
    file = filename.split(/( - |\.)/)
    song = self.create
    song.name = file[2]
    song.artist_name = file[0]
    song
# binding.pry
  end
  #
  def self.destroy_all
    @@all = []
  end
#
#
# end

  #
  # def self.alphabetical
  #   self.all.sort_by{|s| s.name}
  # end

  # def self.new_from_filename(filename)
  #   parts = filename.split(" - ")
  #   artist_name = parts[0]
  #   song_name = parts[1].gsub(".mp3", "")
  #
  #   song = self.new
  #   song.name = song_name
  #   song.artist_name = artist_name
  #   song
  # end
  #
  # def self.create_from_filename(filename)
  #   parts = filename.split(" - ")
  #   artist_name = parts[0]
  #   song_name = parts[1].gsub(".mp3", "")
  #
  #   song = self.create
  #   song.name = song_name
  #   song.artist_name = artist_name
  #   song
  # end
  #
  # def self.destroy_all
  #   self.all.clear
  # end

end
