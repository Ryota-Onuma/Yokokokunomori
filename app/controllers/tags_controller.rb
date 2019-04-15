class TagsController < ApplicationController

  def rateProf
    @professor = Professor.find(params[:id])
    @profRate = Ratedoctor.new
    @profRate.build_level
  end

  def rateCreate
    @professor =  Professor.find(params[:id])
    @profRate = Ratedoctor.create(ratedoctor_params)
    @profRate.build_level

    @profRate.professor_id = @professor.id

      if @profRate.save
        redirect_to controller: 'professors', action: 'show' ,:notice => '投稿が完了しました。'
        else
        redirect_to :action => 'rateProf'
      end

  end



  private


   def ratedoctor_params
     params.require(:ratedoctor).permit(
       :total_satisfaction,:interest,:difficulty,:how_boring,:again,:whyeasyprofc,:comments_for_prof,:professor_id,
       levels_attributes: [:id,:ratedoctor_id,:tagname1,:tagname2,:tagname3,:tagname4,:tagname5,:tagname6,:tagname7,:tagname8])
   end

   def level_params
     params.require(:levels).permit(
       :ratedoctor_id, :tagname1, :tagname2, :tagname3, :tagname, :tagname4, :tagname5, :tagname6, :tagname7, :tagname8
     )
   end

end
