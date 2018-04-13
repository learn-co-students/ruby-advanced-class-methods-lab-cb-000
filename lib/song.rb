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
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      return create_by_name(name)
    else
      return find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song_instance| song_instance.name.downcase}
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1].chomp(".mp3")
    song = new_by_name(name)
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end


end
