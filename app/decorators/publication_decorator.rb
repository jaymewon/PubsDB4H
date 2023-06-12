class PublicationDecorator < Draper::Decorator 
delegate_all

    def pub_status
        case status_id
        when 1
            'archived'
        when 2
            'current'
        when 3
            'needs_update'
        when 4
            'in_progress'
        else
            'missing'
        end
    end

end