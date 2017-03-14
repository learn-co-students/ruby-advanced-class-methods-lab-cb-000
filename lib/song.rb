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



  def self.new_by_name(name)

     song = self.new
     song.name = name
     song
     end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect do |object|
      object.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      self.all.detect do |object|
        object.name == name
      end
    else
      self.create_by_name(name)
    end

  end

  def self.alphabetical
    self.all.sort_by! do |object|
      object.name
    end
  end

  def self.new_from_filename(file)
    file_name = file.split(" - ")
    name = file_name[1].split(".")[0]
    art_name = file_name[0]
    song = self.new
    song.name = name
    song.artist_name = art_name
    self.all << song
    song
  end

  def self.create_from_filename(file)
    file_name = file.split(" - ")
    name = file_name[1].split(".")[0]
    art_name = file_name[0]
    song = self.new
    song.name = name
    song.artist_name = art_name
    self.all << song
    song

  end

  def self.destroy_all
    self.all.clear
  end
end
