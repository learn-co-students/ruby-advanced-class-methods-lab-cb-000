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
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.detect {|i| i.name == name}
  end

  def self.find_or_create_by_name(file)
    if self.find_by_name(file) == nil
      song = Song.create_by_name(file)
    else
      song = Song.find_by_name(file)

    end
  end

  def self.alphabetical
    @@all.sort_by {|word| word.name}
  end

  def self.new_from_filename(file)
    song = Song.new
    song_array = file.split(" - ")
    song_name = song_array[1].chomp(".mp3")
    song.name = song_name
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
