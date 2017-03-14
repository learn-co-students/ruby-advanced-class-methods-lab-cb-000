class Song

  attr_accessor :name, :artist_name

  @@songs = []

  def initialize(n = 'Unnamed')
    @name = n
  end

  def self.all
    @@songs
  end

  def self.create
    all << new
    all.last
  end

  def self.new_by_name(song_name)
    new(song_name)
  end

  def self.create_by_name(song_name)
    all << new(song_name)
    all.last
  end

  def self.find_by_name(n)
    all.size > 0 ? all.detect { |i| i.name == n } : false
  end

  def self.find_or_create_by_name(n)
    find_by_name(n) == nil? ? new_by_name(n) : find_by_name(n)
  end

  def self.alphabetical
    all.sort { |a,b| a.name <=> b.name}
  end

  def self.new_from_filename(n)
    f = n.split(' - ')
    name = f[1].chop[0..-4]
    s = new_by_name(name)
    s.artist_name = f[0]
    s
  end

  def self.create_from_filename(n)
    all << new_from_filename(n)
  end

  def self.destroy_all
    all.clear
  end

end

Song.new_from_filename("Thundercat - For Love I Come.mp3")
Song.create_from_filename("Booku - Laddadee.mp3")