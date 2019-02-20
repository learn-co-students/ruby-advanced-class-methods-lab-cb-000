class Song

  #Class variable
  @@all = []

  #instance accessors
  attr_accessor :name, :artist_name

  #Custom Class Constructors which add new Song 
  #to @@all array
  def self.create
    c = Song.new
    @@all << c
    c
  end

  def self.create_by_name(name)
    c = self.new
    c.name = name
    @@all << c
    c 
  end

  def self.create_from_filename(filename)
    arr = filename.split(".mp3")
    #returns 1 element array
    arr1 = arr[0].split(" - ")
    #returns 2 element array
    artist_name = arr1[0]
    name = arr1[1]
    #puts("Parsed artist_name:  #{artist_name}, song name:  #{name}")
    c = self.create_by_name(name)
    c.artist_name = artist_name
    c
  end

  def self.find_or_create_by_name(name)
    c = self.find_by_name(name)
    if c
      #puts("Found song : #{c}")
      c 
    else
      #c is nill, song doesn't exist, create it
      #puts("Creating song : song name:  #{name}")
      self.create_by_name(name)
    end
  end

  #Custom Class constructors which do NOT add new 
  #instances to @@all array
  def self.new_by_name(name)
      c = self.new
      c.name = name;
      c
  end

  def self.new_from_filename(filename)
    arr = filename.split(".mp3")
    #returns 1 element array
    arr1 = arr[0].split(" - ")
    #returns 2 element array
    artist_name = arr1[0]
    name = arr1[1]
    #puts("Parsed artist_name:  #{artist_name}, song name:  #{name}")
    c = self.new_by_name(name)
    c.artist_name = artist_name
    c
  end

  #methods
  def self.alphabetical
    @@all.sort_by!{ |x| x.name }
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #finder methods
  def self.find_by_name(name)
    #detect returns an object or nil
    @@all.detect{|x| x.name == name}
  end
end
