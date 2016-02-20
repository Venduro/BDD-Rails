# Model represents the inguineering of the site, the user interactivity will not be in this file(user can not change or access the information here) runs the application
# model defines objects what goes in them and what they are, the methods you call on them:
# made car model and year (objects and values) here that can be used in the controller

class Car

#creates instance variables
  def initialize(make,year)
    @make = make
    @year = year
    @lights = false
    @speed = 0
  end

#combines make variable and year variable
  def make_and_model_string
    @make + " " + @year
  end

# this method is alternating the value of something in this case lights being on and off. method that can only be called to the car object (created in the welcome controller)
  def toggleLights
    # toggeling lights on and off with @lights (off) = !@lights (on)
    @lights = !@lights
  end

#method lights shows lights on/ lights off
  def lights
    # when lights are false show off
    if @lights == false
      return "off"

    # if lights are not false show true/ on
    else
      return "on"
    end
  end

  def speed_status
    @speed
  end

  def accelerate
    @speed += 10
  end

end
