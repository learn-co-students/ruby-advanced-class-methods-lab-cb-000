class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    split_filename = filename.split('-')
    song = self.new_by_name(split_filename[1].split('.')[0].strip)
    song.artist_name = split_filename[0].strip
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name==name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song = self.create_by_name(name) if song==nil
    song
  end

  def self.alphabetical
    self.all.sort { |o1, o2 | o1.name <=> o2.name }
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
