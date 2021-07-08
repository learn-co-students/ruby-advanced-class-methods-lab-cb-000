class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create()
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(songName)
    song = self.new
    song.name =  songName
    @@all << song
    song
  end

  def self.create_by_name(songName)
    song = self.new
    song.name =  songName
    @@all << song
    song
  end

  def self.find_by_name(songName)
    @@all.find{|person| person.name == songName}
  end

  def self.find_or_create_by_name(songName)
    foundSong = self.find_by_name(songName)
    #puts "#{foundSong}"
    if ( foundSong == nil)
      self.create_by_name(songName)
    else
      return foundSong
    end

  end

  def self.alphabetical
    return self.all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(fileName)
    artistName = fileName.split(" - " )[0]
    songName = fileName.split(" - ")[1].split(".")[0]

    song = self.new
    song.name =  songName
    song.artist_name =  artistName

    song

    #puts "|#{song.name}|#{song.artist_name}|"

  end

  def self.create_from_filename(fileName)
    artistName = fileName.split(" - " )[0]
    songName = fileName.split(" - ")[1].split(".")[0]

    song = self.new
    song.name =  songName
    song.artist_name =  artistName
    @@all << song
    song

    #puts "|#{song.name}|#{song.artist_name}|"

  end


  def self.destroy_all
    self.all.clear
  end


end


song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
