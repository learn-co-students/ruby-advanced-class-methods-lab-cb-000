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
         song =  Song.new
         @@all << song
         song
    end

    def self.new_by_name(name)
      song = Song.new
      song.name = name
      song
    end
   def self.create_by_name(name)
     song = Song.new
     song.name = name
      @@all << song
     song
   end
   def self.find_by_name(name)
     @@all.detect{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    existingSong = self.find_by_name(name)
    if existingSong
      existingSong
    else
      song = self.create_by_name(name)
      song
    end
  end
  def self.alphabetical
    @@all.sort_by {|song| song.name}
end

  def self.new_from_filename(fileName)
    song  = Song.new
   names = fileName.split(/[\-+,.]/)
    song.name = names[1].strip
    song.artist_name = names[0].strip
    song
  end

  def self.create_from_filename(fileName)
    song  = Song.new
    names = fileName.split(/[\-+,.]/)
    song.name = names[1].strip
    song.artist_name = names[0].strip
    @@all << song
    song

  end

  def self.destroy_all
   self.all.clear
 end
end
