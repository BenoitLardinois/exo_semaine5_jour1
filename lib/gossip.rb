require 'csv'
require 'pry'

class Gossip

  attr_reader :author, :content
  
  def initialize(author, content)
    @content = content
    @author = author
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end
  
  def self.all
    all_gossips = []

    CSV.read("./db/gossip.csv").each do |line|
      all_gossips << Gossip.new(line[0], line[1])
    end
    return all_gossips
  end
  
  def self.find(id)
    return self.all[id]
  end
  
#binding.pry  
end