class Song
  
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def initialize
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    self.all.push(song)
    song
  end
  
  def self.new_by_name(str)
    song = self.new
    song.name = str
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    self.all.push(song)
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by(&:name)
  end
  
  def self.new_from_filename(filename)
    filesplit = filename.split(/[-.]/)
    song = self.new
    self.all.push(song)
    song.name = filesplit[1].lstrip
    song.artist_name = filesplit[0].chop
    song
  end
  
  def self.create_from_filename(filename)
    filesplit = filename.split(/[-.]/)
    song = self.new
    self.all.push(song)
    song.name = filesplit[1].lstrip
    song.artist_name = filesplit[0].chop
    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end
