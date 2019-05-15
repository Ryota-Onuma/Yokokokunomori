class LecturesController < ApplicationController
  def index
    if params[:search] == nil
        @search = Lecture.all
      elsif params[:search] == ""
        @search = Lecture.all
      else
        #部分検索
        @search = Lecture.where("name LIKE ? ",'%' + params[:search] + '%').or(Lecture.where("department LIKE ? ", "%" + params[:search] + "%")).or(Lecture.where("langage LIKE ? ", "%" + params[:search] + "%"))
    end
  end

  def show
    @lecture = Lecture.find(params[:id])
    @lecId= @lecture.id
    @thislecRating = Ratelesson.where(lecture_id: @lecId)

    #総合満足度の平均の計算
    @total_satisfactions = 0
    @totalsatisfactiontotal = Ratelesson.where(lecture_id: @lecId).where.not(total_satisfaction: 0)
     @totalsatisfactiontotal.each do |f|
       @total_satisfactions += f.total_satisfaction
     end
     @howmanyTotalsatis = @totalsatisfactiontotal.count
    @averageTotalsatis = @total_satisfactions/@howmanyTotalsatis.to_f
    @displaytotalsatis = @averageTotalsatis.round(1)
    @displaytotalsatis10x = @displaytotalsatis*10
    #ためになる授業度の平均の計算
    @goodlecture = 0
    @goodlecturesss = Ratelesson.where(lecture_id: @lecId).where.not(interest: 0)
     @goodlecturesss.each do |f|
       @goodlecture += f.interest
     end
     @howmanyInterest =@goodlecturesss.count
    @averageInterest = @goodlecture/@howmanyInterest.to_f
    @displayInterest = @averageInterest.round(1)
    @displayInterest10x = @displayInterest *10
    #楽単度の平均の計算
    @easylecture= 0
    @easyeasyeasy= Ratelesson.where(lecture_id: @lecId).where.not(diffficulty: 0)
     @easyeasyeasy.each do |f|
       @easylecture += f.diffficulty
     end

     @howmanyEasy = @easyeasyeasy.count
    @averageEasy = @easylecture/@howmanyEasy.to_f
    @displayEasy = @averageEasy.round(1)
    @displayEasy10x = @displayEasy*10
    #退屈度の計算
    @boring = 0
    @borings= Ratelesson.where(lecture_id: @lecId).where.not(how_boring: 0)
    @borings.each do |f|
       @boring += f.how_boring
     end
     @howmanyBoring = @borings.count
     @averageBoring = @boring/@howmanyBoring.to_f
      @displayBoring = @averageBoring.round(1)
      @displayBoring10x = @displayBoring*10
    #テストレベルの計算
    @testlevel = 0
    @testlevels= Ratelesson.where(lecture_id: @lecId).where.not(testlevel: 0)
    @testlevels.each do |f|
      @testlevel += f.testlevel
     end
    @howmanyTestlevels = @testlevels.count
    @averageTestlevels = @testlevel/@howmanyTestlevels.to_f
    @displayTestlevels = @averageTestlevels.round(1)
    @displayTestlevels10x = @displayTestlevels*10
    #コメント関連
     @comments = @thislecRating.where.not(commentlec: '')
     #また受けたいか編集
     @againYes= Ratelesson.where(lecture_id: @lecId).where(again: 1)
     @againNo = Ratelesson.where(lecture_id: @lecId).where(again: 0)

     @howmanyYes = @againYes.count
     @howmanyNo = @againNo.count
      gon.data = [@howmanyYes,@howmanyNo]
     #落としたか
     @pass = Ratelesson.where(lecture_id: @lecId).where(failaclass: 1)
     @fail = Ratelesson.where(lecture_id: @lecId).where(failaclass: 0)
     @howmuchYes = @pass.count
     @howmuchNo = @fail.count
     @howmuchTotal =  @howmuchYes + @howmuchNo
     @middleHowmuchYes = @howmuchYes/@howmuchTotal.to_f
     @middleHowmuchNo = @howmuchNo/@howmuchTotal.to_f
     @middleHowmuchYes2 =@middleHowmuchYes.round(2)
     @middleHowmuchNo2 =@middleHowmuchNo.round(2)
     @displayHowmuchYes1 = @middleHowmuchYes2*100
     @displayHowmuchYes =  @displayHowmuchYes1.round(2)
     @displayHowmuchNo1 = @middleHowmuchNo2*100
     @displayHowmuchNo =  @displayHowmuchNo1.round(2)
     #代返
     @daihen1 = Ratelesson.where(lecture_id: @lecId).where(daihen: 1)
     @daihen = @daihen1.count
     @daihen2 = Ratelesson.where(lecture_id: @lecId).where(daihen: 0)
     @nodaihen = @daihen2.count
     #問題回収
     @return1 = Ratelesson.where(lecture_id: @lecId).where(pasttest: 1)
     @return = @return1.count
     @return2 = Ratelesson.where(lecture_id: @lecId).where(pasttest: 0)
     @noreturn = @return2.count
     #出席厳しいか
     @attendance1a = Ratelesson.where(lecture_id: @lecId).where(attendancelevel:'授業開始前には教室にいるべし')
     @attendance1b = @attendance1a.count
     @attendance2a = Ratelesson.where(lecture_id: @lecId).where(attendancelevel:'授業の最初もしくは前半に出席を取る')
     @attendance2b = @attendance2a.count
     @attendance3a = Ratelesson.where(lecture_id: @lecId).where(attendancelevel:'出席を取る時間が不定期')
     @attendance3b = @attendance3a.count
     @attendance4a = Ratelesson.where(lecture_id: @lecId).where(attendancelevel:'授業の後半もしくは最後に出席をとる')
     @attendance4b = @attendance4a.count
     @attendance ={'授業開始前には教室にいるべし' => @attendance1b,'授業の最初もしくは前半に出席を取る' => @attendance2b,'出席を取る時間が不定期' =>@attendance3b,'授業の後半もしくは最後に出席をとる' => @attendance4b}
     @attendanceformax = @attendance.values.max
     @attendanceformax2 = @attendance.select{|k,v|v == @attendanceformax}
     @attendancemax = @attendanceformax2.keys
     @attendancemaxx = @attendanceformax2.values
     @attendanceformin = @attendance.values.min
     @attendanceformin2 = @attendance.select{|a,b|b == @attendanceformin}
     @attendancemin = @attendanceformin2.keys
     @attendanceminn = @attendanceformin2.values
     @test = @attendance.values
     @attendanceformiddle = @test.find {|number| number != @attendanceformax && number != @attendanceformin}
     @attendanceformiddle2 = @attendance.select{|o,s|s == @attendanceformiddle}
     @attendancemiddle = @attendanceformiddle2.keys
     @attendancemiddlee =  @attendanceformiddle2.values

     @nv1 = 0
     @nv2 = 0
     @nv3 = 0
     @nv4 = 0
     @nv5 = 0
     @nv8 = 0
     @aaaaa = [@attendance1b,@attendance2b,@attendance3b,@attendance4b,]
     if @attendance1b != @attendance2b && @attendance1b != @attendance3b && @attendance1b != @attendance4b && @attendance2b != @attendance3b && @attendance2b != @attendance4b && @attendance3b != @attendance4b then
      @aaaaa.each do |t|
        if @nv1 < t
          @nv2 = @nv1
          @nv1 = t
        elsif @nv2 < t
          @nv3 = @nv2
          @nv2 = t
        elsif @nv3 < t
          @nv4 = @nv3
          @nv3 = t
        elsif @nv4 < t
          @nv5 = @nv4
          @nv4 = t
        elsif @nv5 < t
          @nv5 = t
        else
        end
      end
    else
     end

  #テストレベル
@prepare1a = Ratelesson.where(lecture_id: @lecId).where(prepare:'この授業のテスト勉強だけで精一杯')
@prepare1b = @prepare1a.count
@prepare2a = Ratelesson.where(lecture_id: @lecId).where(prepare:'かなり時間を取られる')
@prepare2b = @prepare2a.count
@prepare3a = Ratelesson.where(lecture_id: @lecId).where(prepare:'他授業優先でも、計画的にやれば大丈夫')
@prepare3b = @prepare3a.count
@prepare4a = Ratelesson.where(lecture_id: @lecId).where(prepare:'一夜漬けで大丈夫')
@prepare4b = @prepare4a.count
@prepare5a = Ratelesson.where(lecture_id: @lecId).where(prepare:'ノー勉でも余裕')
@prepare5b = @prepare5a.count
@preparation={'この授業のテスト勉強だけで精一杯' => @prepare1b,'かなり時間を取られる' => @prepare2b,'他授業優先でも、計画的にやれば大丈夫' =>@prepare3b,'一夜漬けで大丈夫' => @prepare4b,'ノー勉でも余裕' => @prepare5b}
@prepareformax = @preparation.values.max
@prepareformax2 = @preparation.select{|k,v|v == @prepareformax}
@preparemax = @prepareformax2.keys
@preparemaxx = @prepareformax2.values
@prepareformin = @preparation.values.min
@prepareformin2 = @preparation.select{|a,b|b == @attendanceformin}
@preparemin = @prepareformin2.keys
@prepareminn = @prepareformin2.values
@preparation2 = @preparation.values
@prepareformiddle = @preparation2.find {|number| number != @prepareformax && number != @prepareformin}
@prepareformiddle2 = @attendance.select{|o,s|s == @prepareformiddle}
@preparemiddle = @prepareformiddle2.keys
@preparemiddlee =  @prepareformiddle2.values

@nb1 = 0
@nb2 = 0
@nb3 = 0
@nb4 = 0
@nb5 = 0
@nb8 = 0
@bbbbb = [@prepare1b,@prepare2b,@prepare3b,@prepare4b,@prepare5b]
if @prepare1b != @prepare2b &&
  @prepare1b != @prepare3b &&
  @prepare1b != @prepare4b &&
  @prepare1b != @prepare5b &&
  @prepare2b != @prepare3b &&
  @prepare2b != @prepare4b &&
  @prepare2b != @prepare5b &&
  @prepare3b != @prepare4b &&
  @prepare3b != @prepare5b &&
  @prepare4b != @prepare5b then
 @bbbbb.each do |t|
   if @nb1 < t
     @nb2 = @nb1
     @nb1 = t
   elsif @nb2 < t
     @nb3 = @nb2
     @nb2 = t
   elsif @nb3 < t
     @nb4 = @nb3
     @nb3 = t
   elsif @nb4 < t
     @nb5 = @nb4
     @nb4 = t
   elsif @nb5 < t
     @nb6 = @nb5
     @nb5 = t
   elsif @nb6 < t
     @nb6 = t
   else
   end
 end
else
end
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
    params.require(:lecture).permit(:name,:lecture_id,:department,:teacher,:langage,:attendance,:lasttest, :midtest, :report, :inlesson, :outlesson,:other)
  end

end
