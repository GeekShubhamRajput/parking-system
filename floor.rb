require 'pry'

class Building

  attr_accessor :floors, :name

  def initialize(name)
    @name = name
    @floors = []
  end

  def add_floors(total_spots)
    floor = Floor.new(total_spots, self)
    @floors << floor
    floor
  end

  def display
    @floors.each_with_index do |floor , index|
      puts "Floor #{index + 1} has #{floor.available_spots} out of #{floor.total_spots} available spots"
    end
    puts "total_spots - #{total_spots} | available_spots - #{available_spots}"
  end

  def total_spots
    floors.sum{|t| t.total_spots} rescue 0
  end

  def available_spots
    floors.sum{|t| t.available_spots} rescue 0
  end
end

class Floor < Building

  attr_accessor :total_spots
 
  def initialize(total_spots, building)
    @building = building
    @total_spots = total_spots
    @available_spots = 0
    @reserved = 0 
  end

  def available_spots
    @total_spots - @reserved
  end

  def reserve_spot
    if available_spots > 0
      @reserved += 1
      available_spots
    else
      puts "No spot available"
    end
  end

end

puts "####  Multi-storey Parking System  ####"

building = Building.new("Kunj Bhawan")
puts "Building name - #{building.name}"
puts 
building.add_floors(10)
building.display
puts 
puts "Add another floor"
building.add_floors(2)
building.display

puts 
puts "Reserve 1 spot at first floor"
booking1 = building.floors.first.reserve_spot
building.display

puts 
puts "Reserve 1 spot at second floor"
booking1 = building.floors[1].reserve_spot
building.display

puts 
puts "Reserve 1 spot at first floor"
booking1 = building.floors.first.reserve_spot
building.display
