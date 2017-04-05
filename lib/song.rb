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

  def self.new_by_name(name, artist=nil)
    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_by_name(name, artist=nil)
    song = self.new_by_name(name, artist)
    song.save
    song
  end

  def self.find_by_name(find_name)
    @@all.detect{|song| song.name == find_name}
  end

  def self.find_or_create_by_name(name, artist=nil)
      if self.find_by_name(name) == name
        self.find_by_name(name)
      else
        self.create_by_name(name, artist)
      end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename = filename.chomp(".mp3")
    arrf = filename.split(" - ")
    artist = arrf[0]
    song = arrf[1]
    self.find_or_create_by_name(song, artist)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
