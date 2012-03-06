class DashboardController < ApplicationController
  
  def index  
    I18n.locale = "es" if request.domain =~ /\.cl$/ && params[:locale].blank?
    @contact_request = ContactRequest.new
  end
  
  # A custom action for World Design Capital 
  # Helsinki 2012 special page
  def wdc
    I18n.locale = "fi"
    @communities = Community.where(:label => "wdc").order("name")
  end
  
  # A custom action for World Design Capital 
  # Helsinki 2012 special page
  def okl
    I18n.locale = "fi"
    @communities = Community.where(:label => "okl").order("name")
  end
  
  # This is for all the custom "campaign" sites
  def campaign
    case params[:page_type]
    when "wdc"
      @communities = Community.where(:label => "wdc").order("name")
      render :wdc
    when *["okl","omakotiliitto"]
      @communities = Community.where(:label => "okl").order("name")
      render :okl
    else
      @contact_request = ContactRequest.new
      render :index
    end
  end
  
end
