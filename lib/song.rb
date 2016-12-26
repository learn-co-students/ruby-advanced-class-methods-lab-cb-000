class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all #class constructor
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
    song = self.create
    song.name =name
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename_input)
    song = self.create
   	file_arr = filename_input.to_s.split(/[-.]/)
 	  song.artist_name = file_arr[0].chop
    song.name = file_arr[1].gsub(/^\s/, "")
    song
  end

  def self.create_from_filename(filename_input)
    song = self.new_from_filename(filename_input)
    song.save
  end

  def self.destroy_all
    song = self.all.clear 
  end
end
