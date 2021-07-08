class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.create
    x = self.new
    @@all << x
    x
  end


  def self.new_by_name(name)
    x = self.new
    x.name = name
    x
  end

  def self.create_by_name(name)
    x = self.new
    x.name = name
    @@all << x
    x
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create_by_name(name) : self.find_by_name(name)
  end

  def self.new_from_filename(filename)
    filename.gsub!(".mp3", "")
    info = filename.split(" - ")
    x = self.new_by_name(info[1])
    x.artist_name = info[0]
    x
  end



  def self.create_from_filename(filename)
    self.new_from_filename(filename).save

  end

end
