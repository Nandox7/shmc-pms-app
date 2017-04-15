class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    # Required for the calendar widget
    @appointments = Appointment.all
  end
end
