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
    self.all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    self.all << song
    song
  end
  
  def self.find_by_name(song_name)
    self.all.each do |song|
     if song.name == song_name
       return song
    end
  end
  return nil
end
  
  def self.find_or_create_by_name(song_name)
    
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      return self.create_by_name(song_name)
    end
  
  end
  
  def self.alphabetical
    array = self.all.sort_by do |song|
      song.name.downcase
    end
    
    array.uniq
  end
  
  def self.new_from_filename(song_name)
    array = song_name.split(/[-.]/)
    name = array[1][1..-1]
    song = self.new_by_name(name)
    song.artist_name = array[0].chomp(" ")
    song
    
  end
  
  def self.create_from_filename(song_name)
    self.all << self.new_from_filename(song_name)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  

end
