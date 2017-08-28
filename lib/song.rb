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

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)

    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end

  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)

    fixed = filename.split(" - ")
    artist_name = fixed[0]
    song_name = fixed[1].chomp(".mp3")
    song = self.find_or_create_by_name(song_name)
    song.artist_name = artist_name
    song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song

  end

  def self.destroy_all
    self.all.clear
  end
end
