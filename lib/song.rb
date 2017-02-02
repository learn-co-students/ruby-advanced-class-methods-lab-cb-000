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

  def self.new_by_name new_song
    song = Song.new
    song.name = new_song
    return song
  end

  def self.create_by_name song_title
    song = Song.new
    song.name = song_title
    song.save
    return song
  end

  def self.find_by_name song_title
    @@all.detect{|i|
      i.name == song_title
    }
  end

  def self.find_or_create_by_name song_title
    if self.find_by_name(song_title)
      self.find_by_name(song_title)
    else
      self.create_by_name(song_title)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song|
      song.name
    }
  end

  def self.new_from_filename name_string
    arr = name_string.split(/[-.]/)
    name = arr[1].lstrip!
    artist = arr[0].strip
    song = Song.new
    song.name = name
    song.artist_name = artist
    return song
  end

  def self.create_from_filename file_name
    self.new_from_filename(file_name).save
  end

  def self.destroy_all
    self.all.clear
  end
end

# Song.find_or_create_by_name ("Wanted")

Song.find_or_create_by_name("wanted")
Song.find_or_create_by_name("apple hole")
Song.find_or_create_by_name("zizazzle")

Song.alphabetical

Song.new_from_filename "Taylor Swift - Blank Space.mp3"
