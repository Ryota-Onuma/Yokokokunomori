class ProfessorsController < ApplicationController
  def index
    if params[:search] == nil
        @search = Professor.all
      elsif params[:search] == ""
        @search = Professor.all
      else
        #部分検索
        @search = Professor.where("name LIKE ? ",'%' + params[:search] + '%').or(Professor.where("department LIKE ? ", "%" + params[:search] + "%"))
    end
  end

  def show
    @professor = Professor.find(params[:id])
    @profId= @professor.id
    @thisProfRating = Ratedoctor.where(professor_id: @profId)

    #総合満足度の平均の計算
    @total_satisfactions = 0
     @thisProfRating.each do |f|
       @total_satisfactions += f.total_satisfaction
     end
     @howmanyTotalsatis = @thisProfRating.count
    @averageTotalsatis = @total_satisfactions/@howmanyTotalsatis.to_f
    @displaytotalsatis = @averageTotalsatis.round(1)
    #ためになる授業度の平均の計算
    @goodlecture = 0
     @thisProfRating.each do |f|
       @goodlecture += f.interest
     end
     @howmanyInterest = @thisProfRating.count
    @averageInterest = @goodlecture/@howmanyInterest.to_f
    @displayInterest = @averageInterest.round(1)
    #楽単度の平均の計算
    @easylecture= 0
     @thisProfRating.each do |f|
       @easylecture += f.difficulty
     end
     @howmanyEasy = @thisProfRating.count
    @averageEasy = @easylecture/@howmanyEasy.to_f
    @displayEasy = @averageEasy.round(1)
    #退屈度の計算
    @boring = 0
     @thisProfRating.each do |f|
       @boring += f.how_boring
     end
     @howmanyBoring = @thisProfRating.count
    @averageBoring = @boring/@howmanyBoring.to_f
    @displayBoring = @averageBoring.round(1)
    #コメント関連
     @comments = @thisProfRating.where.not(comments_for_prof: nil)
   end

  def new
    @professor = Professor.new

  end

  def create
    @professor = Professor.new(professor_params)
    if @professor.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end





  private

   def professor_params
     params.require(:professor).permit(:name,:department,:info)
   end
end
