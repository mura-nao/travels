class ToppagesController < ApplicationController
  def index
    @prefectures = Prefecture.all
  end
end
