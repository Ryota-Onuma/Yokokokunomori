class BasesController < ApplicationController
  def home

  end

  def index1
    if params[:search] == nil
        @search = Professor.all
      elsif params[:search] == ""
        @search = Professor.all
      else
        #部分検索
        @search = Professor.where("name LIKE ? ",'%' + params[:search] + '%').or(Professor.where("department LIKE ? ", "%" + params[:search] + "%"))
    end
  end

  def opinions

  end

  def aboutweb

  end

  def howtouse

  end
end
