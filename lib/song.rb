class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create()
    song = Song.new
    return song.save
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    return song.save
  end

  def self.find_by_name(name)
    return Song.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    returned_song = Song.find_by_name(name)
    if returned_song == nil
      returned_song = Song.new_by_name(name)
    end
    return returned_song
  end

  def self.alphabetical()
    return Song.all.sort{|a,b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    artist_title_array = filename.split("-")
    title_file_type_array = artist_title_array[1].split(".")[0]
    song = Song.new_by_name(artist_title_array[1].split(".")[0].strip)
    song.artist_name = artist_title_array[0].strip
    return song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    return song.save
  end

  def self.destroy_all()
    Song.all.clear
  end

  def self.all
    @@all
  end

  def save
    Song.all << self
    return self
  end

end
