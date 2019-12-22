class PrefecturesController < ApplicationController
  def show
    @prefecture = Prefecture.find(params[:id])
    #@travels = @prefecture.travels.build
    #@travels = Travel.all
    #@travel.prefecture = @prefecture
    #order(id: :desk).page(params[:page])
    
  end
end
