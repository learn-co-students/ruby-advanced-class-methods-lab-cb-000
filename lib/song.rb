class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  #def initialize
#    @@all << self
#  end

  def save
    self.class.all << self
  end

  def self.create
    #Build a class constructor Song.create that initializes a song and saves it to the @@all class variable
    #either literally or through the class method Song.all. This method should return the song instance that
    #was initialized and saved.
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    #Build a class constructor Song.new_by_name that takes in the string name of a song and returns a song instance
    # with that name set as its name property. Song.new_by_name should return an instance of Song and not a simple string
    #or anything else.
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(name)
    # Build a class constructor Song.create_by_name that takes in the string name of a song
    # and returns a song instance with that name set as its name property and the song being saved into the @@all class variable.
    song = self.new_by_name(name)
    #@@all << song
    song
  end

  def self.find_by_name(name)
    #Build a class finder Song.find_by_name that accepts the string name of a song
    # and returns the matching instance of the song with that name.
    # @@all.detect{|person| person.name == name}
    @@all.detect{|song| song.name == name}

  end

  def self.find_or_create_by_name(name)
    #In order to prevent duplicate songs being created that actually represent the same song (based on the song name),
    #we're going to build a Song.find_or_create_by_name class method. This method will accept a string name for a song
    #and either return a matching song instance with that name or create a new song with the name and return the song instance.
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end


  def self.alphabetical
    #SONG.ALPHABETICAL
    #Build a class method Song.alphabetical that returns all the songs in ascending (a-z) alphabetical order.
    #Use Array#sort_by.
    @@all.sort_by{|a| a.name}

  end

  def self.new_from_filename(filename)
  #Build a class constructor that accepts a filename in the format of " - .mp3", for example "Taylor Swift - Blank Space.mp3".
  arr = filename.split(" - ")
  artist_name = arr[0]
  arr2 = arr[1].split(".")
  name = arr2[0]
  song = self.find_or_create_by_name(name)
  song.artist_name = artist_name
  song
  end

  def self.create_from_filename(filename)
    #Build a class constructor that accepts a filename in the format of " - .mp3", for example "Taylor Swift - Blank Space.mp3".
    #The Song.create_from_filename class method should not only parse the filename correctly
    #but should also save the Song instance that was created.
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
