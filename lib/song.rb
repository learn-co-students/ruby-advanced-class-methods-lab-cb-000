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

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = Song.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(title)
    @@all.detect { |song| song.name == title }
  end

  def self.find_or_create_by_name(title)
    song = self.find_by_name(title)

    if song == nil
      self.create_by_name(title)
    else
      song
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(song_file)
    song_data = song_file.split(" - ")
    artist = song_data[0]
    title = song_data[1].split(".mp3").join

    song = Song.new
    song.name = title
    song.artist_name = artist

    song
  end

  def self.create_from_filename(song_file)
    song = self.new_from_filename(song_file)
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end

end
