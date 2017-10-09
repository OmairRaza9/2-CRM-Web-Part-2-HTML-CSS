require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all

  erb :contacts
end

get '/contacts/:id' do

  # params[:id] contains the id from the URL
    @contact = Contact.find_by({id: params[:id].to_i})
  # instructions for how to handle requests to this route will go here
    if @contact
  erb :show_contact
  else
  #  raise Sinatra::NotFound
  end
end

get '/contacts/new' do
   #"Add a new contact"

   erb :new
end

post '/contacts' do
  puts params
end

after do
  ActiveRecord::Base.connection.close
end


#puts Contact.all.inspect
