class PagesController < ApplicationController
  def home
  end

  def calender
    if (params.has_key?(:year))
      if (params.has_key?(:month))
        @time = Time.new(params[:year],params[:month])
       else
        @time = Time.new(params[:year])
      end
    else
      @time = Time.new()
      @time = Time.new(@time.year, @time.month)
    end
  end
  
  def contact_us
  end
end
