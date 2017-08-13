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
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song  = self.new_by_name(song_name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.each do |song|
      if song.name == song_name
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      new_song = self.create_by_name(song_name)
      return new_song
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename_ary = filename.split(' - ')
    artist = filename_ary[0]
    title = filename_ary[1][0..-5]
    song = self.create_by_name(title)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end

end
