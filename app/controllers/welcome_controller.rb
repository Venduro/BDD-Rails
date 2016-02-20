# interactive pieces and goes to the view
class WelcomeController < ApplicationController

# method for creating new cars on the welcome page
  def create_car
    # if the parameter(params) does not have a key(key=something in it) or parameters are full of empty spaces (.empty) take out empty spaces with .strip
    if !params.has_key?(:make)||params[:make].strip.empty?
      #returns or reloads the create car page
      render "create_car"
    #
    else
      # creates the variable, automobile, and assigns it to a new object, Car.new, which needs two parameters.
      @car = Car.new(params[:make], params[:year])
      # saves parameter (make) in cookies to be accessed in the status page. converts :car to automobile variable and is stored using yaml(yaml is a placeholder for a database).
      session[:car] = @car.to_yaml
      # after parameters (make,year) are submitted redirect the page to the Status/show page.
      redirect_to "/status/show"
    end
  end
end
