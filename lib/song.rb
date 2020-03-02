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
    song = Song.new
    @@all << song
    return song
  end
  
  def self.new_by_name(string)
    new_song = Song.new
    new_song.name = string
    return new_song
  end
  
  def self.create_by_name(string)
    new_song = Song.new
    new_song.name = string
    @@all << new_song
    return new_song
  end
  
  def self.find_by_name(string)
    @@all.each do |song_object|
      if song_object.name.to_s == string
        return song_object
        #return song_object.inspect.to_s
      else
        # do nothing
      end
    end
    puts "not found"
  end
  
  def self.find_or_create_by_name(string)
    if self.find_by_name(string)
      return find_by_name(string)
    else
      self.create_by_name(string)
    end
  end
  
  def self.alphabetical
    return @@all.sort_by { |song_object| song_object.name }
  end
  
  def self.destroy_all
    @@all = []
    return @@all
  end
  
  def self.new_from_filename(string)
    temp_array = string.split(" - ")
    artist_name = temp_array[0]
    song_name = temp_array[1]
    song_name = song_name[0..song_name.length-5]
    song_obj = self.new_by_name(song_name)
    song_obj.artist_name = artist_name
    return song_obj
  end
  
  def self.create_from_filename(string)
    temp_array = string.split(" - ")
    artist_name = temp_array[0]
    song_name = temp_array[1]
    song_name = song_name[0..song_name.length-5]
    song_obj = self.create_by_name(song_name)
    song_obj.artist_name = artist_name
    return song_obj
  end

end






















