class Song
  attr_accessor :name, :artist_name, :song_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect do |value|
      value.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    unless self.find_by_name(song_name)
      self.create_by_name(song_name)
    end
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    a_name = array[0]
    s_name = array[1]

    song = self.new
    song.name = s_name.chomp(".mp3")
    song.artist_name = a_name
    song
  end

  def self.create_from_filename(filename)
    array = filename.split(" - ")
    a_name = array[0]
    s_name = array[1]

    song = self.new
    song.name = s_name.chomp(".mp3")
    song.artist_name = a_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
