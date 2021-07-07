class Song
  
  @@all = []
  
  def self.all
    @@all
  end
  
   def self.create()
    new_song = self.new()
    @@all << new_song
    new_song
  end
  
  def self.new_by_name(name)
    new_song = self.new()
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    @@all << new_song
    new_song
  end
  
  def self.find_by_name(name)
    @@all.detect{ |song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil 
      self.create_by_name(name)
    else self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(mp3)
    result = mp3.split(' - ')
    song = self.create()
    song.artist_name = result[0]
    title = result[1]
    song.name = title.slice!(0...-4)
    song
  end
  
  def self.create_from_filename(mp3)
    result = mp3.split(' - ')
    song = self.create()
    song.artist_name = result[0]
    title = result[1]
    song.name = title.slice!(0...-4)
    song
  end
  
  def self.destroy_all
    @@all = []
  end
  
  attr_accessor :name, :artist_name
 

  def save
    self.class.all << self
  end
  
  
end
