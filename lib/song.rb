require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    generated = Song.new
    @@all << generated
    generated
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(song_name)
    generated = Song.new
    generated.name=(song_name)
    generated
  end

  def self.create_by_name(song_name)
    generated = Song.new
    generated.name=(song_name)
    @@all << generated
    generated
  end

  def self.find_by_name(song_name)
    @@all.find {|item| item.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    names_array = []
    names_array = @@all.collect {|song| song.name}
    alph_names_array = names_array.sort {|a, b| a <=> b}
    final_array = []
    final_array = alph_names_array.collect {|song_name| self.find_by_name(song_name)}
    final_array
  end

  def self.new_from_filename(song_file_name)
    split_array = []
    split_array = song_file_name.split(" - ")
    generated = Song.new
    split_array[1] = split_array[1].split(".")[0]
    generated.artist_name=(split_array[0])
    generated.name=(split_array[1])
    generated
  end

  def self.create_from_filename(song_file_name)
    split_array = []
    split_array = song_file_name.split(" - ")
    generated = Song.new
    split_array[1] = split_array[1].split(".")[0]
    generated.artist_name=(split_array[0])
    generated.name=(split_array[1])
    @@all << generated
    generated
  end

  def self.destroy_all
    @@all = []
  end

end

puts Song.create_from_filename("System of a Down - Toxicity.mp3")
