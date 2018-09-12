class Vampire
    # Class variables
    @@coven = []

    # Class methods
    def self.sunrise
        binding.pry
        @@coven.delete_if do |vampire|
            vampire.drank_blood_today == false
        end
    end

    def self.sunset
        @@coven.each do |vampire|
            vampire.drank_blood_today = false
            vampire.in_coffin = false
        end
    end

    def self.create
        new_vampire = Vampire.new
        @@coven << new_vampire
        return new_vampire
    end

    # Instance methods
    def initialize
        @drank_blood_today = false
        @in_coffin = true
    end

    def drink_blood
        @drank_blood_today = true
    end

    def go_home
        @in_coffin = true
    end

    attr_accessor :drank_blood_today
    attr_accessor :in_coffin
end