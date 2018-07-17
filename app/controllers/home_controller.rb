class HomeController < ApplicationController
  def index

    @arriendos = User.select('users.id u_id','users.nombre u_nombre','users.email u_email')
                       
  end
  
  def formulario
    @series = Serie.all
    @peliculas = Movie.all
  end
  
  def crear_arriendos(usuario,hash_movie,hash_arriendo)
    
    hash_movie.each do |mo|
      usuario.arriendos.create(id: Arriendo.ultimo, movie_id: mo, serie_id: 0)
    end
    
    hash_arriendo.each do |se|
      usuario.arriendos.create(id: Arriendo.ultimo, movie_id: 0, serie_id: se)
    end
  end
  
  def guardar
    get_nombre = params[:usuario]['nombre']
    get_email = params[:usuario]['email']
    
    @user = User.create(id: User.ultimo , nombre: get_nombre, email: get_email)
    
    crear_arriendos(@user,params[:movie],params[:serie])
    
    redirect_to home_path
  end
  
  def borrar
    usuario = User.find(params[:id])
    
    usuario.destroy
    redirect_to home_path
  end
  
  def editar
    @series = Serie.all
    @peliculas = Movie.all
    @editar = User.select('users.id u_id','users.nombre u_nombre','users.email u_email').find_by(id: params[:id])

    @get_movies = Arriendo.select('movies.id','movies.titulo')
                  .joins(:movie)
                  .where(:user_id => params[:id])
                  
                  
    @get_series = Arriendo.select('series.id','series.titulo')
                  .joins(:serie)
                  .where(:user_id => params[:id])
                  
    @array_movies = Array.new
    @array_series = Array.new
    
    @get_movies.each do |array|
     @array_movies.push(array.id)
    end
    
    @get_series.each do |array|
     @array_series.push(array.id)
    end

  end
  
  def grabar
    @get_user = User.find_by(id: params[:id])
    @get_user.nombre = params[:usuario]['nombre']
    @get_user.email = params[:usuario]['email']
    @get_user.save
    
    Arriendo.where(user_id: params[:id]).destroy_all

    crear_arriendos(@get_user,params[:movie],params[:serie])
    
    redirect_to home_path
  end

 
  
end
