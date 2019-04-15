class LecturesController < ApplicationController
  def index
    if params[:search] == nil
        @search = Lecture.all
      elsif params[:search] == ""
        @search = Lecture.all
      else
        #部分検索
        @search = Lecture.where("name LIKE ? ",'%' + params[:search] + '%').or(Lecture.where("department LIKE ? ", "%" + params[:search] + "%"))
    end
  end

  def show
    @lecture = Lecture.find(params[:id])
  end

  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
  end
end

  private
  def lecture_params
    params.require(:lecture).permit(:name,:professor_id,:department,:genre)
  end

end
