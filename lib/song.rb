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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    # Search through array for Current Song
    # Return current song if it equates to song being passed
    @@all.detect{|x| self.name.object_id if x.name == name}
  end

  def self.find_or_create_by_name(name)
    if !(@@all.include?(name))
      #If name exists in all class variable
      self.create_by_name(name)
    else
      #If name doesn't exist
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    alphabetical = self.all.sort_by{|x| x.name}
    alphabetical.uniq
  end

  def self.new_from_filename(name)
    parsed_name = name.split(" - ")
    parsed_artist = parsed_name[0]
    song = self.new
    song.name = parsed_name[1].split(".")[0]
    song.artist_name = parsed_artist
    song
  end

  def self.create_from_filename(name)
    parsed_name = name.split(" - ")
    parsed_artist = parsed_name[0]
    song = self.create
    song.name = parsed_name[1].split(".")[0]
    song.artist_name = parsed_artist
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
