class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = Song.new
    @@all << song  
    song 
  end 
  
   def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end
  
   def self.create_by_name(string)
    song = self.new
    song.name = string
    @@all << song
    song 
  end 
  
  def self.find_by_name(string)
    @@all.find{|song| song.name == string}
  end 
  
   def self.find_or_create_by_name(string)
      c = find_by_name(string)
      if c 
        c   
      else 
        self.create_by_name(string)
      end
  end 
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end 
  
  def self.new_from_filename(data)
    data = data.split(" - ")
    artist_name = data[0]
    name = data[1].chomp(".mp3")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end 
  
  def self.create_from_filename(data)
    data = data.split(" - ")
    artist_name = data[0]
    name = data[1].chomp(".mp3")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
     song
  end
  
  def self.destroy_all
    self.all.clear
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
