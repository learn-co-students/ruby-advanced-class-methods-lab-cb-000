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
    #initializes a song and saves it to the @all class variable literally or using Song.all
    #return the song instance that was initialized and saved
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    #takes in the string name of a song and returns a song instance with that name set as its name property
    #return an instance of a song and not simple string or anything else
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
    #takes in the string name of a song and returns a song instance with that name set as its name property and the song being saved into the @all class variable
  end

  def self.find_by_name(name)
    #accepts the string name of a song and returns the matching instance of the song with that name
    song = Song.all.detect{ |title| title.name == name }
    song
  end

  def self.find_or_create_by_name(name)
    #This method accepts a string name for a song and either returns a matching song instance with that name
    #or creates a new song with the name and returns the song instance
    song = Song.find_by_name(name)
    song ||= Song.create_by_name(name)
  end

  def self.alphabetical
    #returns the songs in order from a-z
    #use sort_by
    song_names = @@all.sort_by {|title| title.name}
    song_names
  end

  def self.new_from_filename(filename)
    #accepts a filename in the format of -.mp3
    #the constructor should return a new song instance
    #You must parse the filename for relevant components with deliminater -
    #You must remove the mp3 part of the string
    name, song = filename.split(" - ")
    artist = self.new_by_name(song.chomp(".mp3"))
    artist.artist_name = name
    artist
  end

  def self.create_from_filename(filename)
    #accepts filename in format of -mp3
    #parses filename and instance in which song was created
    name, song = filename.split(" - ")
    artist = self.create_by_name(song.chomp(".mp3"))
    artist.artist_name = name
    artist
  end

  def self.destroy_all
    #resets @all to an empty array
    self.all.clear
  end

end
