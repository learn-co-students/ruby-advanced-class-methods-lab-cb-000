
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    song = @@all.detect {|tune| tune.name == name}
  end  
  def self.find_or_create_by_name(name)
    song = @@all.detect {|tune| tune.name == name}
    if song == nil
      song = Song.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name} 
  end

  def self.new_from_filename(file)
    artist = file.split(" - ")
    song = Song.new_by_name(artist[1].split(".")[0])
    song.artist_name = artist[0]
    song
  end
  
  def self.create_from_filename(file)
    artist = file.split(" - ")
    song = Song.new_by_name(artist[1].split(".")[0])
    song.artist_name = artist[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
    
  def save
    self.class.all << self
  end

end
