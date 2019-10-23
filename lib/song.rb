class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name=song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|song| song.name==song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort{|x,y| x.name<=>y.name}
  end

  def self.new_from_filename(filename)
    song=self.new_by_name(filename.split(/[-.]/)[1].strip)
    song.artist_name=filename.split(/[-.]/)[0].strip
    song
  end

  def self.create_from_filename(filename)
    song=self.create_by_name(filename.split(/[-.]/)[1].strip)
    song.artist_name=filename.split(/[-.]/)[0].strip
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
