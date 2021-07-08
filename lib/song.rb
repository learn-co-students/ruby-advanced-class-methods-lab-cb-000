require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

# Creates new song, shovels into @@all and returns the new song
  def self.create
    new_song = self.new
    new_song.save
    new_song
  end
# Sets the new song name and returns it
  def self.new_by_name(name_string)
    title = self.new
    title.name = name_string
    title
  end
#Same as above but saves it into @@all
  def self.create_by_name(name_string)
      title = self.new
      title.name = name_string
      title.save
      title
  end
# Searches by name
  def self.find_by_name(name_string)
     self.all.detect {|i| i.name == name_string}
  end
# Finds and creates if cant find
  def self.find_or_create_by_name(lookup)
    found = self.find_by_name(lookup)
    unless found
      self.create_by_name(lookup)
    else
      found
    end
  end
# Sorts everything in @@all by name
    def self.alphabetical
      self.all.sort_by { |n| n.name }
    end
# Parse a filename and split into Artist name and Song title
    def self.new_from_filename(file)
     song = self.new
     song.name = file.split(" - ")[1].chop.chop.chop.chop
     song.artist_name = file.split(" - ")[0]
     song
   end
# Same as above but saves
  def self.create_from_filename(file)
    song = self.new
    song.name = file.split(" - ")[1].chop.chop.chop.chop
    song.artist_name = file.split(" - ")[0]
    song.save
    song
  end
# Makes .all = @@all
  def self.all
    @@all
  end
# Saves song into self
  def save
    self.class.all << self
  end

# Wipes storage clean
    def self.destroy_all
     @@all.clear
    end

end
