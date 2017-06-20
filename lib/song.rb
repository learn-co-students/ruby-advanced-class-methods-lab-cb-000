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
    newSong = Song.new
    newSong.save
    newSong
  end

  def self.new_by_name( name )
    newSong = Song.new
    newSong.name = name
    #newSong.save

    #return a Song object
    newSong
  end

  def self.create_by_name( name )
    newSong = Song.new
    newSong.name = name
    newSong.save

    #return a Song object
    newSong
  end

  def self.find_by_name( name )
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name( name )
    self.find_by_name( name ) || self.create_by_name( name )
  end

  def self.alphabetical
    #print self.all.name
    self.all.sort_by{ |song| song.name }
  end

  def self.new_from_filename( filename )
    #puts filename
    myArray = []
    myArray = filename.split(" - ")
    artist_name = myArray[0]

    song_name = myArray[1].split(".")
    #puts song_name[0]
    newSong = self.new
    newSong.name = song_name[0]
    newSong.artist_name = artist_name
    newSong
  end

  def self.create_from_filename( filename )
    #puts filename
    myArray = []
    myArray = filename.split(" - ")
    artist_name = myArray[0]

    song_name = myArray[1].split(".")
    #puts song_name[0]

    newSong = self.create
    newSong.name = song_name[0]
    newSong.artist_name = artist_name
    newSong
  end

  def self.destroy_all
    self.all.clear
  end

end  # class Song
