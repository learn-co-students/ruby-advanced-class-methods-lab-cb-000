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
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    return song
  end

  def self.find_by_name(name)
    return self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    result = self.create_by_name(name) if result == nil
    return result
  end

def self.alphabetical
  return self.all.sort { |a,b| a.name <=> b.name}
end

def self.new_from_filename(filename)
  data = filename.split(" - ")
  artist = data[0]
  song_name = data[1].chomp(".mp3")
  song = self.new_by_name(song_name)
  song.artist_name = artist
  return song
end


def self.create_from_filename(filename)
  song = self.new_from_filename(filename)
  song.save
end

def self.destroy_all
  self.all.clear
end


end
