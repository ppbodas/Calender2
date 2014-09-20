class PagesController < ApplicationController
  def home
  end

  def calender
    # Get correct time 
    if (params.has_key?(:year))
      if (params.has_key?(:month))
        @time = DateTime.new(params[:year].to_i,params[:month].to_i)
       else
        @time = DateTime.new(params[:year].to_i)
      end
    else
      @time = DateTime.now()
      @time = DateTime.new(@time.year, @time.month)
    end
    
    #get first day of week
    first_day_of_week = @time.wday + 1
    
    #get last date of month
    @last_date_of_month = Date.new(@time.year, @time.month, -1).day
    
    #strat creating string
    @str = "<tr>"
    #print first week
    i = 1
    dummy_space = 1
    while (dummy_space < first_day_of_week)
      @str += "<td>&nbsp</td>" 
      dummy_space = dummy_space + 1
    end
    while (i <= (8-first_day_of_week))
      @str += "<td>#{i}</td>"
      i = i +1
    end
    @str += "</tr>"
    
    x = 3
    if((i + 28) < @last_date_of_month)
      x = 4
    end
    
    #print rest of week
    x.times do |j|
      @str += "<tr>"
      7.times do |k|
        @str += "<td>#{i}</td>" 
        i = i +1
      end
      @str += "</tr>"
    end   
    1.times do |j|
      @str += "<tr>"
      7.times do |k|
        @str += "<td>#{i}</td>"
        i = i +1
        if (i > @last_date_of_month)
          break
        end
      end
      @str += "</tr>"
    end
    @previous_year = @time.year
    @next_year = @time.year
    @previous_month = @time.month - 1
    @next_month = @time.month + 1
    if (@previous_month < 1)
      @previous_month = 12
      @previous_year -= 1
    end
    if (@next_month > 12)
      @next_month = 1
      @next_year += 1
    end
  end
  
  def contact_us
  end
end
