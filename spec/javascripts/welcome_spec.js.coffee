#= require test_helper

describe "Main Page", ->
  it "shows welcome message", ->
    EmberApp.reset()
    visit("/").then ->
      find("h1").text().should.equal("Welcome")
