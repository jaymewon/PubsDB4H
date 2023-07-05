require 'active_record'
require 'date'

ActiveRecord::Base.logger = Logger.new(STDOUT)

today = Date.today

Publication.all.each do |p|
    if p.expiration == today
        unless p.status_id == Status::ARCHIVED
            p.update( status_id: Status::ARCHIVED )
            puts "EXPIRED - #{p.pub_num_prefix.name}-#{p.pub_number}, #{p.title}"
        else
            puts "ERROR? - ALREADY EXPIRED - #{p.pub_num_prefix.name}-#{p.pub_number}, #{p.title}"
        end
    else
        puts "OK - #{p.pub_num_prefix.name}-#{p.pub_number}, #{p.title}"
    end
end