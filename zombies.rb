class Zombie
    # Class Variables
    @@horde = []
    @@plague_level = 10

    # Class constants
    @@MAX_SPEED = 5
    @@MAX_STRENGTH = 8
    @@DEFAULT_SPEED = 1
    @@DEFAULT_STRENGTH = 3

    # Class methods
    def self.all
        return @@horde
    end

    def self.new_day
        self.some_die_off
        self.spawn
        self.increase_plague_level
    end

    def self.some_die_off
        (rand(@@horde.length+1)).times do
            @@horde.pop
        end
    end

    def self.spawn
        rand(@@plague_level+1).times do
            new_zombie = Zombie.new(rand(@@MAX_SPEED+1), rand(@@MAX_STRENGTH+1))
            @@horde << new_zombie
            puts "New Zombie!"
        end
    end

    def self.increase_plague_level
        @@plague_level += rand(3)
    end

    # Instance methods
    def initialize(speed, strength)
        speed > @@MAX_SPEED ? @speed = @@DEFAULT_SPEED : @speed = speed
        strength > @@MAX_STRENGTH ? @strength = @@DEFAULT_STRENGTH : @strength = strength
    end

    def encounter
        if self.outrun_zombie?
            puts "You escaped!"
        elsif self.survive_attack?
            puts "You became a zombie!"
            new_zombie = Zombie.new(rand(@@MAX_SPEED+1), rand(@@MAX_STRENGTH+1))
            @@horde << new_zombie
        else
            puts "You died"
        end
    end

    def outrun_zombie?
        rand(@@MAX_SPEED+1) > self.speed ? true : false
    end

    def survive_attack?
        rand(@@MAX_STRENGTH+1) > self.strength ? true : false
    end

    attr_reader :speed
    attr_reader :strength
end

puts Zombie.all.inspect # [] 
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died