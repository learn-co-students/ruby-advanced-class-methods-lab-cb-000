require_relative './artist'
require_relative './song'
require_relative './findable'
require 'pry'
require 'rake'

def reload!
  load './artist.rb'
  load './song.rb'
  load './findable.rb'
end

task :console do
  Pry.start
end
