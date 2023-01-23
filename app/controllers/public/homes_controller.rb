class Public::HomesController < ApplicationController
  

  def top
    @recruitments = Recruitment.all
  end

  
end
