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
    song = Song.new #song is a class instance variable
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
  @@all << song
  song
end

def self.find_by_name(input)
  @@all.detect do
    |song| song.name == input
  end
end

def self.find_or_create_by_name(input)
  if @@all.include?(input)
    @@all.detect do
      |song| song.name == input
    end
  else
    song = Song.new
    song.name = input
    song
  end
end

def self.alphabetical
  self.all.sort_by! {|song| song.name}
end

def self.new_from_filename(input)
  song = Song.new
  data = input.split(" - ")
  song.artist_name = data[0]
  second = data[1].split(".")
  song.name = second[0]
song
end

def self.create_from_filename(input)
  song = Song.new
  data = input.split(" - ")
  song.artist_name = data[0]
  second = data[1].split(".")
  song.name = second[0]
@@all << song
end

def self.destroy_all
  @@all = []
end

end
