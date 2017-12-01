class Song
  attr_accessor :name, :artist_name # Song instances have basic properties of a name and an artist name
  @@all = [] # class variable @@all to store all instances for Song

  def self.all
    @@all
  end

  # instances of Song that are created through the instance method Song#save
  def save
    self.class.all << self
  end

  # instantiate and save the song, and return the new song that was created)
  def self.create # 1. build a class constructor Song.create
    song = Song.new # 2. that initializes a song
    song.save # 3. and saves it to the @@all class variable
    return song # 4. this method should return the song instance that was initialized and saved.
  end

  # instantiate a song with a name property
  def self.new_by_name(name)
    song = Song.new # 1. intialize a song
    song.name = name # 2. set the song's name equal to the argument that is passed
    return song # return the song instance
  end

  # instantiates and saves a song with a name property
  def self.create_by_name(name) # 1. build a class constructor Song.create_by_name that takes in the string name of a song
    song = Song.new # 1. initialize a song
    song.name = name # 2. set the song's name property equal to the argument that is passed
    song.save # 3. save the song into the @@all class variable
    return song # 4. return the song instance
  end

end
