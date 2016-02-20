class StatusController < ApplicationController

#
  def show
    # yaml stores the object for retrieval
    @car = YAML.load(session[:car])
  end

# this method takes the object Car, calls the method from car.rb (togglelights) to change the value of lights and saves the objs that has been changes into cookies. reload the pg to see lights (html) change
  def lights_button
    # pulling/decryting @car object (which is part of the car class) from car.rb from encrypted cookies(session)
    @car = YAML.load(session[:car])
    #toggling the value of @lights on the car object
    @car.toggleLights
    # create encryted cookies for car class and storing with yaml
    session[:car] = @car.to_yaml
    # reloading and reopening the status show page with the new information received from the server
    redirect_to "/status/show"
  end

  def accelerate_button
    @car = YAML.load(session[:car])
    @car.accelerate
    session[:car] = @car.to_yaml
    redirect_to "/status/show"
  end
end
