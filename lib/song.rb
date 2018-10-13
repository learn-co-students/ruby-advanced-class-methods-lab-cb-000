class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil, artist_name=nil)
    @name = name
    @artist_name = artist_name
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.new(name)
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new(name)
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| name == song.name}
  end

  def self.find_or_create_by_name(name)
    song_found = find_by_name(name)
    return song_found if song_found
    song = create_by_name(name)
    song
  end

  def self.new_from_filename(filename)
    artist_name =  filename.split("-")[0].strip
    name = filename.split("-")[1].split(".")[0].strip
    song = self.new(name, artist_name)
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
