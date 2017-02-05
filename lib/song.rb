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
  	new = self.new
  	new.save
  	return new
  end

  def self.new_by_name(name)
  	new = self.new
  	new.name = name
  	return new
  end

  def self.create_by_name(name)
  	new = Song.new
  	new.name = name
  	new.save
  	new
  end

  def self.find_by_name(name)
  	#find a song present in @@all by name
  	@@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	 if Song.find_by_name(name) == nil 
  	 	Song.create_by_name(name)
  	 elsif Song.find_by_name(name) != nil
  	 	Song.find_by_name(name)
  	 end
  end

  def self.alphabetical
  	#sort
  	@@all.sort! { |a,b| a.name.downcase <=> b.name.downcase }
  end

  def self.new_from_filename(filename)
  	song = self.new
  	filename = filename.split(" - ")
  	song.name = filename[1].split(".mp3")
  	song.name = song.name.join("") 
  	song.artist_name = filename[0]
  	song
  end

  def self.create_from_filename(filename)
  	new = Song.new
  	filename = filename.split(" - ")
  	new.name = filename[1].split(".mp3")
  	new.name = new.name.join("")
  	new.artist_name = filename[0]
  	new.save
  	new
  end

  def self.destroy_all
  	@@all = []
  end
end
