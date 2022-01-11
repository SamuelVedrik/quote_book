class Quote < ApplicationRecord

    after_initialize :load_images

    def self.get_random
        # ids = Quote.all.pluck(:id)
        # Quote.find(ids.sample)
        Quote.order(Arel.sql("RANDOM()")).first
    end

    def self.random_image
        @@images.sample
    end
    
    def self.loc
        return rand(-30..30), rand(-30..30)
    end

    private

    def load_images
        @@images = []
        File.open("data/images.txt").each do |image|
            @@images << image
        end
    end
end
