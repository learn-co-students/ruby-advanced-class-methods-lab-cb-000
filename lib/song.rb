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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    song = Song.all.detect{|title| title.name == name}
    song
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    song ||= Song.create_by_name(name)
  end

  def self.alphabetical
    names = @@all.sort_by {|obj| obj.name}
    names
  end

  def self.new_from_filename(full_song)
    name, song = full_song.split(" - ")
    artist = self.new_by_name(song.chomp(".mp3"))
    artist.artist_name = name
    artist
  end

  def self.create_from_filename(full_song)
    name, song = full_song.split(" - ")
    artist = self.create_by_name(song.chomp(".mp3"))
    artist.artist_name = name
    artist
  end

  def self.destroy_all
    self.all.clear
  end

end
