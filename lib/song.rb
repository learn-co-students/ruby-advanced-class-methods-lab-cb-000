class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end


  def self.create
    song = self.new
    @@all << song
    song
  end


  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end


  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end


  def self.find_by_name(name)
    self.all.detect do |song|
      if song.name == name
        song
      end
    end
  end


  def self.find_or_create_by_name(name)
    self.all.detect do |song|
      if song.name == name
        song
      end
    end
    song = self.new
    song.name = name
    @@all << song
    song
  end


  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end


  def self.new_from_filename(filename)
    filename.sub!(/(.mp3)/, "")
    file_arr = filename.split(' - ')

    song = self.new
    song.artist_name = file_arr[0]
    song.name = file_arr[1]
    song
  end


  def self.create_from_filename(filename)
    filename.sub!(/(.mp3)/, "")
    file_arr = filename.split(' - ')

    song = self.new
    song.artist_name = file_arr[0]
    song.name = file_arr[1]
    @@all << song
    song
  end


  def self.destroy_all
    @@all.clear
  end
end

##Song.new_from_filename("Taylor Swift - Blank Space.mp3")
