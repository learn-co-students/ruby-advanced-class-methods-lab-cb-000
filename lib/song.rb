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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    return new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    return new_song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    search_result = @@all.detect{|song| song.name == name}
    if search_result.nil?
      new_song = self.new
      new_song.name = name
      @@all << new_song
      return new_song
    else
      @@all.detect{|song| song.name == name}
    end
  end

  def self.alphabetical
    @@all.sort_by!{|song| song.name}
  end

  def self.new_from_filename(filename)
    filename.gsub!('.mp3', '')
    array = filename.split('-')
    array[0].rstrip!
    array[1].lstrip!
    new_song = self.new
    new_song.name = array[1]
    new_song.artist_name = array[0]
    return new_song
  end

  def self.create_from_filename(filename)
    filename.gsub!('.mp3', '')
    array = filename.split('-')
    array[0].rstrip!
    array[1].lstrip!
    new_song = self.new
    new_song.name = array[1]
    new_song.artist_name = array[0]
    @@all << new_song
    return new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
