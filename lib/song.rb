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
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
      song = self.create_by_name(name)
      song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
    arr = filename.scan(/(^\w+[^\s*]) - (([A-Za-z]*\s*)*)/)
    # binding.pry
    song = self.new
    song.name = arr[0][1]
    song.artist_name = arr[0][0]
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    arr = filename.scan(/(^\w+[^\s*]) - (([A-Za-z]*\s*)*)/)
    song = self.create
    song.name = arr[0][1]
    song.artist_name = arr[0][0]
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
