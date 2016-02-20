require 'rails_helper'

RSpec.feature "MakeAndModels", type: :feature do
  # context can be used for organization to eliminate redunancy
  # context "When I visit the Welcome page" do
  #     context "As an internet user" do (each do needs an end)
  it "show Welcome to the Car Simulator" do
    # the test is sent(routed) to the /welcome/create_car it matches route url
    visit '/welcome/create_car'
    #expect site to have this string "Welcome..."
    expect(page).to have_content("Welcome to the Car Simulator")
  end

  # test the create make and year simulator
  # This test asks the user for a make and year.
  it "As an internet user, when I visit the welcome page, I am asked for make and model year of the car to be simulated." do
    visit '/welcome/create_car'
    expect(page).to have_field("Make")
    expect(page).to have_field("Year")
  end

  #the user must enter and make and model and be able to click on a button labeled simulate car, this is a test for that.
  it "As an internet user, when I visit the welcome page, after entering make and model year, and clicking on a button labelled Simulate Car." do
    visit_welcome_and_fill_in_make_and_model_click_button
    # used to view(render) the page
    # save_and_open_page
  end

  it "I am taken to a status page showing make and model year of the car." do
    visit_welcome_and_fill_in_make_and_model_click_button
    visit '/status/show'
  end

  # tests lights to show status and tests to see if lights are off, start off (false)
  it "s an internet user, when I visit the status page for a selected car, it shows whether the lights on the car are on or off. They start off." do
    visit_welcome_and_fill_in_make_and_model_click_button
    visit '/status/show'
    expect(page).to have_content("Lights")
    expect(page).to have_content("off")
  end

  # tests if lights turn on or off
  it "As an internet user, when I visit the status page, I can turn the lights on using a button that toggles between show On and Off." do
    visit_welcome_and_fill_in_make_and_model_click_button
    visit '/status/show'
    click_button 'Lights'
    expect(page).to have_content("Lights")
    expect(page).to have_content("on")
  end

  # test current speed starts at zero
  it "As an internet user, when I visit the car status page, I can see the cars current speed. It starts a zero." do
    visit_welcome_and_fill_in_make_and_model_click_button
    visit '/status/show'
    expect(page).to have_content("Speed")
    expect(page).to have_content("0")
  end

  # test that accelerate button shows on status page
  it "As an internet user, when I visit the car status page, I can click on an accelerate button, which makes the car go faster, and which is shown in the car status page." do
    visit_welcome_and_fill_in_make_and_model_click_button
    visit '/status/show'
    # checks page for string "speed"
    expect(page).to have_content("Speed")
    # checks page for "0" anywhere on the page
    expect(page).to have_content("0")
    # checks for accelerate button clicks it to speed up
    click_button 'accelerate'
    # checks that speed increases to 10
    expect(page).to have_content("10")
    # clicks button again
    click_button 'accelerate'
    # checks that speed increases to 20
    expect(page).to have_content("20")
  end

  # tests for brake button ((((WIP)))) (work in progress)
  it "As an internet user, when I visit the car status page, I can click on an brake button, which makes the car go slower, and shows that in the car status page." do
    visit_welcome_and_fill_in_make_and_model_click_button
    visit '/status/show'
    click_button 'Brake'
  end

  # method for car information
  def visit_welcome_and_fill_in_make_and_model_click_button
    visit '/welcome/create_car'
    fill_in("Make", with: 'CJ6')
    fill_in("Year", with: '1986')
    expect(page).to have_field("Make", with: "CJ6")
    expect(page).to have_field("Year", with: "1986")
    click_button 'Simulate Car'
  end


end
