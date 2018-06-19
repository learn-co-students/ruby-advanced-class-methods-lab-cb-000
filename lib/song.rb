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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name= name
    song
  end
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song

  end

def self.find_by_name(name)
self.all.find{|person| person.name == name}
end




def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    return self.find_by_name(name)
  else
    self.create_by_name(name)
   end
end


def self.alphabetical
  self.all.sort_by{|song| song.name}
end


def self.new_from_filename(song)
  instance_of_song = self.new
  titleandartist = song.gsub(".mp3", "").split(" - ")
  instance_of_song.name = titleandartist[1]
  instance_of_song.artist_name = titleandartist[0]
return instance_of_song
end

def self.create_from_filename(song)
  @@all << self.new_from_filename(song)

end


def self.destroy_all
  self.all.clear
end

end
