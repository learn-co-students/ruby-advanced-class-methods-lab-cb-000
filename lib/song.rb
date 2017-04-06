class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    s = Song.new
    self.all << s
    s
  end

  def self.new_by_name(name)
    s = Song.new
    s.name = name
#    self.all << s
    s
  end

  def self.create_by_name(name)
    s = Song.new
    s.name = name
    self.all << s
    s
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name }
  end

  def self.new_from_filename(filename)
    s = Song.new
    s.artist_name = filename.split(" - ").first
    s.name = filename.split(" - ")[1].split(".").first
    s
  end

  def self.create_from_filename(filename)
    s = Song.new
    s.artist_name = filename.split(" - ").first
    s.name = filename.split(" - ")[1].split(".").first
    self.all << s
    s
  end


  def self.destroy_all
    self.all.clear
  end

end

#song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
#filename = "Thundercat - For Love I Come.mp3"
#filename.split(" - ").first
#filename.split(" - ")[1].split(".").first
#
#song1 = Song.new_from_filename(filename)
#
#song1.artist_name
#
#Song.all
#filename = "Thundercat - For Love I Come.mp3"
#filename.split(" - ").first
#filename.split(" - ")[1].split(".").first
