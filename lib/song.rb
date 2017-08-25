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
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    test = self.find_by_name(name)
    return test if test
    self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(file)
    artist = file.split(" - ")[0]
    name = file.split(" - ")[1].split(".mp3")[0]
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    artist = file.split(" - ")[0]
    name = file.split(" - ")[1].split(".mp3")[0]
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
