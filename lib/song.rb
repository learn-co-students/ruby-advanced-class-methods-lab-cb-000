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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    # song.name = 'countdown'
    # song.artist_name = 'journey'
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    x = self.find_by_name(name)

    if x.nil?
      self.create_by_name(name)
    else
      x
    end
  end

  def self.alphabetical
    self.all.sort_by { |k| k.name }
  end

  def self.new_from_filename(name)
    song = self.new
    name = name.split('.')[0].split(' - ')
    song.name = name[1]
    song.artist_name = name[0]
    song
  end

  def self.create_from_filename(name)
    song = self.new
    name = name.split('.')[0].split(' - ')
    song.name = name[1]
    song.artist_name = name[0]
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear

  end
end
