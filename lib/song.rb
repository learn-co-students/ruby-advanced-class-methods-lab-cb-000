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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == name
      return name
    else create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    song = self.new_by_name(file.split(/[-.]/)[1].strip)
    song.artist_name = file.split(/[-.]/)[0].strip
    song
  end

  def self.create_from_filename(file)
    song = self.create_by_name(file.split(/[-.]/)[1].strip)
    song.artist_name = file.split(/[-.]/)[0].strip
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
