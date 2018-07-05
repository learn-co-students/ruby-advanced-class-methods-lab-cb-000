class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=" ", artist_name=" ")
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.create
    song = self.new
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    self.new(name)
  end

def self.find_by_name(songname)
  @@all.find{|song| song.name == songname}
end


def self.find_or_create_by_name(songname)
  if self.find_by_name(songname)
    self.find_by_name(songname)
  else
    self.create_by_name(songname)
  end
end

def self.destroy_all
  @@all.clear
end


end
