class TagsController < ApplicationController

  def rateProf
    @professor = Professor.find(params[:id])
    @profRate = Ratedoctor.new
  
  end

  def rateCreate
    @professor =  Professor.find(params[:id])
    @profRate = Ratedoctor.create(ratedoctor_params)

    @profRate.professor_id = @professor.id

      if @profRate.save
        redirect_to controller: 'professors', action: 'show' ,:notice => '投稿が完了しました。'
        else
        redirect_to :action => 'rateProf'
      end

  end

  def rateLec
   @lecture = Lecture.find(params[:id])
   @lecRate = Ratelesson.new

  end

  def rateCreate2
    @lecture = Lecture.find(params[:id])
    @lecRate = Ratelesson.create(ratelesson_params)
    @lecRate.lecture_id = @lecture.id

    if @lecRate.save
      redirect_to controller: 'lectures', action: 'show' ,:notice => '投稿が完了しました。'
      else
      redirect_to :action => 'rateLec'
    end
  end

  private


   def ratedoctor_params
     params.require(:ratedoctor).permit(
       :total_satisfaction,
       :interest,
       :difficulty,
       :how_boring,
       :again,
       :whyeasyprofc,
       :comments_for_prof,
       :professor_id,
       :tagname1,
       :tagname2,
       :tagname3,
       :tagname4,
       :tagname5,
       :tagname6,
       :tagname7,
       :tagname8)
   end
   def ratelesson_params
     params.require(:ratelesson).permit(
                                  :total_satisfaction,
                                  :interest,
                                  :diffficulty,
                                  :how_boring,
                                  :failaclass,
                                  :attendancelevel,
                                  :daihen,
                                  :testlevel,
                                  :prepare,
                                  :pasttest,
                                  :again,
                                  :commentlec,
                                  :lecture_id)
   end
end
