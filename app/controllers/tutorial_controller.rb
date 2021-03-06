class TutorialController < ApplicationController

  # Tutoriais que aparecem na pagina principal
  def list
    if params["category_id"]
        @tutorials = Tutorial.all(:joins => :categories,
                                  :conditions => {:categories => {:id => params["category_id"]}})
                             .paginate(:page => params[:page], :per_page => 20)
    else
        @tutorials =  Tutorial.all(:order => 'up_votes DESC').paginate(:page => params[:page], :per_page => 20)
    end
  end

  def up_vote
    if user_signed_in?
        @tutorial = Tutorial.find(params[:id])
        current_user.up_vote!(@tutorial)
        render('show')
    else
      redirect_to(:controller => 'users', :action => 'sign_in')
    end
  end

  def down_vote
    if user_signed_in?
        @tutorial = Tutorial.find(params[:id])
        current_user.down_vote!(@tutorial)
        render('show')
    else
      redirect_to(:controller => 'users', :action => 'sign_in')
    end
  end

  def new
    @tutorial = Tutorial.new
  end

  def create

      # Buscando categorias pelos nomes passados na tela
      # gsub(/, /, ',') => Ex.: Helena, Maria, Carvalho, Freire => Helena,Maria,Carvalho,Freire --> remove whitespaces between commas
      # split(",") => Ex.: "Helena, Maria, Carvalho, Freire" => ["Helena", "Maria", "Carvalho", "Freire"] --> String to Array
      @categories = Category.find_by_sql ["SELECT * FROM categories where name in (?)", params[:categories_names].gsub(/, /, ',').split(",")]
      clear_description(params[:tutorial])
      @tutorial = Tutorial.new(params[:tutorial])
      @tutorial.user_id = rand(1...100)
      @tutorial.categories << @categories

      if @tutorial.save
        redirect_to(:controller => 'welcome', :action => 'profile', :id => @tutorial.user.id)
      else
        render('new')
      end
  end

  def show
    @tutorial = Tutorial.find(params[:id])
  end

  def clear_description(value)
    #Precisei fazer isso para funcionar o iframe do youtube.
    #O gsub é um replace. Ele troca a primeira string pela segunda string.
    @new_description = value[:description].gsub('&lt;','<').gsub('&gt;','>')
    value[:description] = @new_description
  end

end