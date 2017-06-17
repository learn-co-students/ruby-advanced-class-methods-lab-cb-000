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

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.split_filename(filename)
    (artist, title, fformat) = filename.split(%r{\s*-\s*|\s*\.\s*})
  end

  def self.new_from_filename(filename)
    sfn = split_filename(filename)
    song = new_by_name(sfn[1])
    song.artist_name = sfn[0]
    song
  end

  def self.create_from_filename(filename)
    sfn = split_filename(filename)
    song = create_by_name(sfn[1])
    song.artist_name = sfn[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
