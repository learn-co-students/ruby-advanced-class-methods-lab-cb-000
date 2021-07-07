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
    new_song=self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song=self.new
    new_song.name=(name)
    new_song.save
    new_song
  end

  def self.create_by_name(name)
    new_song=self.new
    new_song.name=(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    named_song=self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    song_info=filename.split(" - ")
    new_song=self.new
    song_name=song_info[1].split(".mp3")
    new_song.name=song_name[0]
    new_song.artist_name=song_info[0]
    new_song.save
    new_song
  end

  def self.create_from_filename(filename)
    song_info=filename.split(" - ")
    new_song=self.new
    song_name=song_info[1].split(".mp3")
    new_song.name=song_name[0]
    new_song.artist_name=song_info[0]
    new_song.save
    new_song
  end #what doe they want by the difference between new and create? Do they just want one to create it and the other to save it?

  def self.destroy_all
    self.all.clear
  end

end
