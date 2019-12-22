class ToppagesController < ApplicationController
  def index
    @prefecture = Prefecture.new(name:"宮城県")
    @prefecture = Prefecture.new(name:"山形県")
    @prefecture = Prefecture.new(name:"福島県")
    @prefectures = Prefecture.all
  end
end
