class Song
  @@all = []
  attr_accessor :name, :artist_name

  # Class methods
  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if found
      return found
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    # Trim extension, split
    song_details = filename.sub(/\.mp3/, "").split(" - ")
    new_song = self.new
    new_song.artist_name = song_details[0]
    new_song.name = song_details[1]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

  # instance methods


  def save
    self.class.all << self
  end

end
