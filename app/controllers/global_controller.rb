require './helpers/utility'
class GlobalController < ApplicationController
  def index
    give_response("00", "SERVICE RAILS VERSION 1.0.0")
  end
end
