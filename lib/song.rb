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
    @@all << song
    @@all.last
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  def self.find_by_name(name)
    @@all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    return self.find_by_name(name) if self.find_by_name(name) != nil
    self.create_by_name(name)
    end

    def self.alphabetical
      @@all.sort_by{ |song|  song.name }
    end

    def self.new_from_filename(filename)
      arr = filename.split(/[^A-Z,a-z]/)
      artist_name = arr[0..1].join(" ").strip
      name = arr[3..6].join(" ")
      song = self.new
      song.artist_name = artist_name
      song.name = name
      song
    end

    def self.create_from_filename(filename)
      arr = filename.split(/[^A-Z,a-z]/)
      artist_name = arr[0..1].join(" ").strip
      name = arr[3..6].join(" ")
      song = self.new
      song.artist_name = artist_name
      song.name = name
      song.save
      song
    end

    def self.destroy_all
   self.all.clear
 end

end
