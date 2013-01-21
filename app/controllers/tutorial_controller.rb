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

  def create_random_users

    File.open("users.txt", "w") do |f|

        (1..100).each{|i|

          insert = ""

          o =  [('a'..'z')].map{|i| i.to_a}.flatten
          username  =  (0...10).map{ o[rand(o.length)] }.join

          pass = '123456'
          pass_encrypt = BCrypt::Password.create(pass)

          email = username+'@gmail.com'

          insert = "INSERT INTO USERS VALUES ("
          insert << i.to_s+",'"+email+"','"+pass_encrypt+"',0,0,null,null,null,null,current_date,current_date, '127.0.0.1', '127.0.0.1',current_date,current_date);"

          f.write(insert+"\n")
        }

    end

  end

  def create_random_tutorials

    File.open("tutorials.txt", "w") do |f|

        (1..1000).each{|i|

          insert = ""

          o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
          subtitle  =  (0...15).map{ o[rand(o.length)] }.join
          text  =  (0...50).map{ o[rand(o.length)] }.join

          user_id = rand(1...100)
          category_id = rand(1...2)
          title = "teste"+i.to_s

          insert = "INSERT INTO TUTORIALS VALUES ("
          insert << i.to_s+","+user_id.to_s+",1,'"+title+"','"+subtitle+"','"+text+"',0,0,current_date,current_date);"

          join = "INSERT INTO CATEGORIES_TUTORIALS VALUES ("
          join << category_id.to_s+","+i.to_s+");"

          f.write(insert+"\n")
          f.write(join+"\n")
        }

    end

  end

  def clear_description(value)
    #Precisei fazer isso para funcionar o iframe do youtube.
    #O gsub é um replace. Ele troca a primeira string pela segunda string.
    @new_description = value[:description].gsub('&lt;','<').gsub('&gt;','>')
    value[:description] = @new_description
  end

end