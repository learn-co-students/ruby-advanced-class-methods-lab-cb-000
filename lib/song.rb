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

  def self.destroy_all
    @@all.clear
  end

end
