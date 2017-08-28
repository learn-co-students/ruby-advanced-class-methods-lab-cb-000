class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name=name
    song
  end




  def self.find_by_name(name)
    return self.all.detect{|song|song.name==name}

  end

  def self.find_or_create_by_name(name)
    song = self.all.detect{|song|song.name==name}
    if song
       return song
    else  self.create_by_name(name)
    end
  end

  def self.alphabetical
    (self.all).sort_by{|song|song.name}
  end

  def self.new_from_filename(name)
    arr = name.split(" - ").join(".").split(".")
    artist = arr[0]
    song_name = arr[1]
    file_type = arr[2]
    song = self.new_by_name(song_name)
    song.artist_name=artist
    song
  end


  def self.create_from_filename(name)
    arr = name.split(" - ").join(".").split(".")
    artist = arr[0]
    song_name = arr[1]
    file_type = arr[2]
    song = self.create_by_name(song_name)
    song.artist_name=artist
    song
  end

  def self.destroy_all
    @@all.clear
  end


end
