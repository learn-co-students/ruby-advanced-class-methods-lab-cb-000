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
    @@all << song
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
    @@all << song
    song
  end

  def self.find_by_name(name)
    Song.all.detect{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      song = Song.new
      song.name = name
      @@all << song
      song
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    working_filename1 = filename.split(" - ")
    song.artist_name = working_filename1[0]
    working_filename2 = working_filename1[1].split(".")
    song.name = working_filename2[0]
    song
  end

  def self.create_from_filename(filename)
    song = Song.new
    working_filename1 = filename.split(" - ")
    song.artist_name = working_filename1[0]
    working_filename2 = working_filename1[1].split(".")
    song.name = working_filename2[0]
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end
end
