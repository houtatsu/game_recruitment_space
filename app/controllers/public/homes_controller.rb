class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
  def top
    @recruitments = Recruitment.all
  end
end
