
class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎来到Super招聘网！"
  end   
end
