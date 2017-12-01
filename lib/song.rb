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

end
