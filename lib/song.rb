class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  
  end

  def initialize
  
  end

  def self.create
      s = self.new
      s.save
      @@all.include?(s)
      s
      
  end

  def self.new_by_name(song_name_string) 
      s = self.new
      s.name = song_name_string
      s
      
  end

  def self.create_by_name(song_name_string)
    s = self.new
    s.name = song_name_string
    s.save
    @@all.include?(song_name_string)
    s

  end

  def self.find_by_name(song_name_string)
    @@all.detect{|s|s.name == song_name_string}

  end

  def self.find_or_create_by_name(song_name_string)
      if self.find_by_name(song_name_string) == nil 
           self.create_by_name(song_name_string)
      else self.find_by_name(song_name_string) 
      end
     
  end

  def self.alphabetical
      @@all.sort_by{|s|s.name}

  end

  def self.new_from_filename(mp3_file)
      f = self.new
      f.name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
      f.artist_name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
      f
  end

  def self.create_from_filename(mp3_file)
    f = self.new
    f.name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    f.artist_name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    f.save
    f
  end

  def self.destroy_all
      @@all = [ ]
  end 

  def save
    self.class.all << self
  end

end

