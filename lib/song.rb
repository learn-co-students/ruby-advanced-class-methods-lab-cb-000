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
    song.save
    song
  end

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end

  def self.create_by_name(song_title)
    song = self.new
    song.name = song_title
    song.save
    song
  end

  def self.find_by_name(song_title)
    Song.all.detect{|s| s.name == song_title}
  end

  def self.find_or_create_by_name(song_title)
    if self.find_by_name(song_title) == nil
      self.create_by_name(song_title)
    else
      self.find_by_name(song_title)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(/\W/)
    artist_name = data[0]
    # Line 52 really sucks. Not sure why I get the empty string elements in my array. It works but it's weird..
    title = data[3..-2].join(" ")
    song = self.new
    song.artist_name = artist_name
    song.name = title
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(/\W/)
    artist_name = data[0]
    title = data[3..-2].join(" ")
    song = self.new
    song.artist_name = artist_name
    song.name = title
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
