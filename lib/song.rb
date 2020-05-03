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
    song.save
    song
  end
  # .create instantiates and saves the song, and it returns the new song that was created

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  # .new_by_name instantiates a song with a name property

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  # .create_by_name instantiates and saves a song with a name property

  def self.find_by_name(name)
    self.all.detect do |x|
      x.name == name
    end
  end
  # .find_by_name can find a song present in @@all by name

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |x|
      x.name
    end
  end

  def self.new_from_filename(file)
    pair = file.split(" - ")
    artist_name = pair[0]
    song_name = pair[1].chomp(".mp3")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  # Song.new_from_filename("Thundercat - For Love I Come.mp3")

  def self.create_from_filename(file)
    pair = file.split(" - ")
    artist_name = pair[0]
    song_name = pair[1].chomp(".mp3")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
