

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
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.all.detect { |song| song.name == name } == nil
      song = self.new
      song.name = name
      self.all << song
      song
    else
      self.all.detect { |song| song.name == name }
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by { |song| song.name.downcase }
    sorted
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    artist_name = file[0]
    name = file[1].chop[0..-4]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    file = filename.split(" - ")
    artist_name = file[0]
    name = file[1].chop[0..-4]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
