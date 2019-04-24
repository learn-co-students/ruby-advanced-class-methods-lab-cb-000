class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
   song = self.new
   @@all << song
   song
 end

 def self.new_by_name(name)
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
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song != nil
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    song = self.new
    new_file = filename.split("-")
    song.name = new_file[1].sub(".mp3","").strip
    song.artist_name = new_file[0].strip
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    new_file = filename.split("-")
    song.name = new_file[1].sub(".mp3","").strip
    song.artist_name = new_file[0].strip
    @@all << song
    song
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

end
