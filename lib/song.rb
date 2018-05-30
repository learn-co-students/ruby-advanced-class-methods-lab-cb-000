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

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
       song.name == name
    end

  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    sorted_songs = []
    self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(file)
    artist_and_songname = file.split(" - ")
    songname = artist_and_songname[1].split(".mp3")
    artist = artist_and_songname[0]
    split_song = songname[0]

    song = self.new
    song.name = split_song
    song.artist_name = artist
    self.all << song
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

  def self.destroy_all
    self.all.clear
  end
end

# class Song
#   attr_accessor :name, :artist_name
#
#   @@all = []
#
#   def self.all
#     @@all
#   end
#
#   def self.new_from_filename(file)
#     artist_and_songname = file.split(" - ")
#     songname = artist_and_songname[1].split(".mp3")
#     artist = artist_and_songname[0]
#     split_song = songname[0]
#
#     song = self.new
#     song.name = split_song
#     song.artist_name = artist
#     self.all << song
#     song
#
#   end
#
# end
#
#
#
# song1 = Song.new_from_filename("Thundercat - For Love I Come.mp3")
