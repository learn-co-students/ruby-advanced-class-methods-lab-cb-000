class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    all << song
    song
  end

  def self.find_by_name(name)
    all.detect {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) == true ? name : create_by_name(name)
  end

  def self.alphabetical
    all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    song = self.new
    name_of_artist = name.match(/\-(.*?)\./).strip
    song.name = name_of_artist
    all << song
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
