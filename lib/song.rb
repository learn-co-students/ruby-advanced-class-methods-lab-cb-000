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
    song = Song.create # combine steps 1 and 3
      # song = Song.new # 1. initialize a song
    song.name = name # 2. set the song's name property equal to the argument that is passed
      # song.save # 3. save the song into the @@all class variable
    return song # 4. return the song instance
  end

  # find a song present in @@all by name
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name} # use the #detect method to return the first object that has a @name property equal to the argument that is passed
  end

  # invokes .find_by_name and .create_by_name instead of repeating code
  # returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
  # creates a new Song object with the provided title if one doesn't already exist
  def self.find_or_create_by_name(name)
    return self.find_by_name(name) || self.create_by_name(name)
  end

  # returns all the song instances in alphabetical order by song name
  def self.alphabetical
    @@all.sort_by {|song| song.name} # sort_by method: https://apidock.com/ruby/Enumerable/sort_by
  end

end
