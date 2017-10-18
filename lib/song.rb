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
    song.save
    song
  end

    def self.new_by_name(song_name)
      song = self.new
      song.name = song_name
      song
    end

    def self.create_by_name(song_name)
      song = self.create
      song.name = song_name
      song
    end

    def self.find_by_name(name)
      namez = []
      self.all.detect {|i| i.name == name}
    end

    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
    end

    def self.alphabetical
      self.all.sort_by{|i| i.name } #sort_by alphabetical
    end

    def self.new_from_filename(data)
      song_data = data.split(" - ")
      artist = song_data[0]
      song_name = song_data[1]
      song_name_trim = song_name[0...-4]
      song = self.create_by_name(song_name_trim)
      song.artist_name = artist
      song
    end

    def self.create_from_filename(data)
      song_data = data.split(" - ")
      artist = song_data[0]
      song_name = song_data[1]
      song_name_trim = song_name[0...-4]
      song = self.create_by_name(song_name_trim)
      song.artist_name = artist
      song
    end

    def self.destroy_all
      self.all.clear
    end

end
