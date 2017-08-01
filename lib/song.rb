class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name = nil, artist_name = nil)
    song = Song.new
    if name
      song.name = name
    end
    if artist_name
      song.artist_name = artist_name
    end
    @@all << song
    song
  end

  def self.new_by_name (name)
     Song.create(name)
  end

  def self.create_by_name (name)
     Song.create(name)
  end

  def self.find_or_create_by_name(name)
     song = find_by_name(name)
     song ||= create_by_name(name)
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

  def self.new_from_filename(filename)
    temp = filename.split("-")
    artist_name = temp[0].chop
    name = temp[1]
    4.times { name.chop! }
    name = name.strip
    song =  Song.create(name,artist_name)
    song
  end





  def self.destroy_all
    @@all = []
  end
end
