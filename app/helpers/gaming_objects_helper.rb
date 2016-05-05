module GamingObjectsHelper
    
    def duration_string_to_numeric(duration_string)
        case duration_string
        when "year"
            1.year
        when "month"
            1.month
        when "week"
            1.week
        else
            nil #Stands for "all time from the beginning of the universe" 
        end
    end
    
end
