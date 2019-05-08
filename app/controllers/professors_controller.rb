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
    @totalsatisfactiontotal = Ratedoctor.where(professor_id: @profId).where.not(total_satisfaction: 0)
     @totalsatisfactiontotal.each do |f|
       @total_satisfactions += f.total_satisfaction
     end
     @howmanyTotalsatis = @totalsatisfactiontotal.count
    @averageTotalsatis = @total_satisfactions/@howmanyTotalsatis.to_f
    @displaytotalsatis = @averageTotalsatis.round(1)
    @displaytotalsatis10x = @displaytotalsatis*10
    #ためになる授業度の平均の計算
    @goodlecture = 0
    @goodlecturesss = Ratedoctor.where(professor_id: @profId).where.not(interest: 0)
     @goodlecturesss.each do |f|
       @goodlecture += f.interest
     end
     @howmanyInterest =@goodlecturesss.count
    @averageInterest = @goodlecture/@howmanyInterest.to_f
    @displayInterest = @averageInterest.round(1)
    @displayInterest10x = @displayInterest *10
    #楽単度の平均の計算
    @easylecture= 0
    @easyeasyeasy= Ratedoctor.where(professor_id: @profId).where.not(difficulty: 0)
     @easyeasyeasy.each do |f|
       @easylecture += f.difficulty
     end

     @howmanyEasy = @easyeasyeasy.count
    @averageEasy = @easylecture/@howmanyEasy.to_f
    @displayEasy = @averageEasy.round(1)
    @displayEasy10x = @displayEasy*10
    #退屈度の計算
    @boring = 0
    @borings= Ratedoctor.where(professor_id: @profId).where.not(how_boring: 0)
    @borings.each do |f|
       @boring += f.how_boring
     end
     @howmanyBoring = @borings.count
     @averageBoring = @boring/@howmanyBoring.to_f
      @displayBoring = @averageBoring.round(1)
      @displayBoring10x = @displayBoring*10
    #コメント関連
     @comments = @thisProfRating.where.not(comments_for_prof: '')
     #また受けたいか編集
     @againYes= Ratedoctor.where(professor_id: @profId).where(again: 1)
     @againNo = Ratedoctor.where(professor_id: @profId).where(again: 0)

     @howmanyYes = @againYes.count
      @howmanyNo = @againNo.count
      gon.data = [@howmanyYes,@howmanyNo]

     @tag1= Ratedoctor.where(professor_id: @profId).where(tagname1: 1)
     @tag2= Ratedoctor.where(professor_id: @profId).where(tagname2: 1)
     @tag3= Ratedoctor.where(professor_id: @profId).where(tagname3: 1)
     @tag4= Ratedoctor.where(professor_id: @profId).where(tagname4: 1)
     @tag5= Ratedoctor.where(professor_id: @profId).where(tagname5: 1)
     @tag6= Ratedoctor.where(professor_id: @profId).where(tagname6: 1)
     @tag7= Ratedoctor.where(professor_id: @profId).where(tagname7: 1)
     @tag8= Ratedoctor.where(professor_id: @profId).where(tagname8: 1)
     @tag1nv = @tag1.count
     @tag2nv = @tag2.count
     @tag3nv = @tag3.count
     @tag4nv = @tag4.count
     @tag5nv = @tag5.count
     @tag6nv = @tag6.count
     @tag7nv = @tag7.count
     @tag8nv = @tag8.count
     @tagtags = [@tag1nv,@tag2nv,@tag3nv,@tag4nv,@tag5nv,@tag6nv,@tag7nv,@tag8nv]
     @tagmax = @tagtags.max
     @tagmin = @tagtags.min


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
