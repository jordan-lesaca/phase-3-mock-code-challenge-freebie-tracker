class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies
    
    def recieved_one?(item_name)
        self.freebies.any? do |freebie|
            freebie.item_name == item_name
        end
    end

    def give_away(freebie, dev)
        freebie.update(dev: dev)
    end
end