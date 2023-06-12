module AdminHelper
    def self.next_pub_number
        Publication.maximum( 'pub_number' ) + 1
    end
end
