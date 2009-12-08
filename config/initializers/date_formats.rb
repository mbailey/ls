Time::DATE_FORMATS[:date_and_time] = "%e %b %Y %l:%M %p"
Time::DATE_FORMATS[:date] = "%e %b %Y"
Time::DATE_FORMATS[:time] = lambda {|time| time.strftime("%l:%M %p").strip }
