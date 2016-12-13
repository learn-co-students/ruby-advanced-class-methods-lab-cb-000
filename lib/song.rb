class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create
    song = self.new
    song.save
    song
  end


  def self.alphabetical
    self.all.sort_by{|word| word.name}
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end


  def self.new_from_filename(filename)
    contents  = filename.split('-').collect{|words| words.strip!}
    song_name = contents[1].chomp('.mp3')
    artist_name = contents[0]

    #now create new Song
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    contents  = filename.split('-').collect{|words| words.strip!}
    song_name = contents[1].chomp('.mp3')
    artist_name = contents[0]

    #now create new Song
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  




end
