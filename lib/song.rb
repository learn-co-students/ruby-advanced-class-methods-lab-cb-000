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
    song = self.new
   song.save
   song
  end

  def self.new_by_name (song_name)
    song = self.new 
    song.name = song_name 
    song
  end
# #  song = self.new	
# -    song.name = song_name	
# -    song


  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end
#   -    song = self.create	
# -    song.name = song_name	
# -    song


  def self.find_by_name (song_name)
    #self.all.detect{|song| song == song_name}
    self.all.detect do |song|  
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name) 
  end

  def self.alphabetical 
    Song.all.sort_by do |song_inst| 
      song_inst.name
    end
  end

  def self.new_from_filename(file)
    split_file = file.split(" - ")
    s_artist = split_file[0]
    s_title= split_file[1].gsub ".mp3", ""
   
    song=Song.new
    song.artist_name = s_artist
    song.name = s_title
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save 
  end

  def self.destroy_all
  self.all.clear
  #self.all = []
  end

end