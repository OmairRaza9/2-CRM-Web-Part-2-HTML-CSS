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
  raise Sinatra::NotFound
end
end



after do
  ActiveRecord::Base.connection.close
end

#irb
# Contact.create(first_name: "Omair", last_name: "Raza", email: "o.com", note: "great")
# Contact.create(first_name: "jim", last_name: "Halpert", email: "jh@dundermifflinINFINITY.com", note: "second-second life")
# load "contact.rb"
#to show -> I can do Contact.all
puts Contact.all.inspect
