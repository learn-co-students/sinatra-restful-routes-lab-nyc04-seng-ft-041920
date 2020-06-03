class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    
    redirect '/recipes'
  end
  
  get '/recipes' do 
    # binding.pry
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  

  get '/recipes/:id' do  
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  post '/recipes' do
    # binding.pry
    recipe = Recipe.create(params[:recipe])
    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do  
    recipe = Recipe.find(params[:id])
    recipe.update(params[:recipe])
    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id' do  
    Recipe.destroy(params[:id])
    redirect '/recipes'
  end


end
