require 'pry'
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
    @@all << self.new
    @@all[-1]
  end

  def self.new_by_name(song_name)
  song = self.new
  song.name = song_name
  song
  end


  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

 def self.find_or_create_by_name (song_name)
   if self.find_by_name(song_name) != nil
    self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
   end
 end


  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
      song = self.new
      data = file.split(" - ")
      artist_name = data[0]
      name = data[1].delete_suffix('.mp3')
      song.name = name
      song.artist_name = artist_name
      song
    end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
