Rails.application.routes.draw do

 root to: "bases#home"
 get 'professors' => "professors#index"
 get 'lectures' => "lectures#index"
 resources :lectures, only: [:index, :create, :new, :show,]
 resources :professors, only: [:index, :create, :new, :show,]
 get 'bases/home' => "bases#home"
 get 'ratedoctor/:id' => "tags#rateProf",as: 'ratedoctor'
 post 'ratedoctor/:id' => "tags#rateCreate"

 get 'bases/opinions' => "bases#opinions"
 get 'bases/aboutweb' => "bases#aboutweb"
 get 'bases/howtouse' => "bases#howtouse"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
