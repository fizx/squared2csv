# You'll need to require these if you
# want to develop while running with ruby.
# The config/rackup.ru requires these as well
# for it's own reasons.
#
# $ ruby heroku-sinatra-app.rb
#
require 'rubygems'
require 'sinatra'
require File.dirname(__FILE__) + "/doc2csv"

# Quick test
get '/' do
  erb :index
end

post '/convert' do
  doc = Nokogiri::HTML(params[:html])
  headers "Content-Disposition" => "attachment;filename=squared.csv",
          "Content-Type" => "application/octet-stream"
  doc2csv doc
end