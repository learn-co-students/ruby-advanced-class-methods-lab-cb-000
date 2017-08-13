class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name name
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name name
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name name
    @@all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name name
    # self.create_by_name name unless find_by_name name
    song = self.find_by_name(name) ? find_by_name(name) : self.create_by_name(name)
    song
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename filename
    file_name_splitted = filename.split(" - ")
    song_artist_name = file_name_splitted.first
    song_name = file_name_splitted.last.split(".").first

    song = self.new
    song.name = song_name
    song.artist_name = song_artist_name
    song.save

    song
  end

  def self.create_from_filename filename
    file_name_splitted = filename.split(" - ")
    song_artist_name = file_name_splitted.first
    song_name = file_name_splitted.last.split(".").first

    song = self.new
    song.name = song_name
    song.artist_name = song_artist_name
    song.save

    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
