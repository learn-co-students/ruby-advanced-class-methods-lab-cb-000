require 'pry'
# Song class
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    c = self.new
    c.save
    c
  end

  def self.new_by_name(name)
    nbn = self.new
    nbn.name = name
    nbn
  end

  def self.create_by_name(name)
    cbn = self.new
    cbn.name = name
    cbn.save
    cbn
  end

  def self.find_by_name(name)
    @@all.detect { |e| e.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name).nil? ? create_by_name(name) : find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by(&:name)
  end

  def self.new_from_filename(file_name)
    song = self.new

    split = file_name.split(' - ')
    a_name = split[0]
    s_name = split[1].chomp('.mp3')

    song.artist_name = a_name
    song.name = s_name
    song
  end

  def self.create_from_filename(file_name)
    song = self.new

    split = file_name.split(' - ')
    a_name = split[0]
    s_name = split[1].chomp('.mp3')

    song.artist_name = a_name
    song.name = s_name
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
