# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

articles = Article.create([
  { :user_id => 1, :title => 'Monoceros beginning', :subtitle => 'A BDD love story', :content => "Its 6 am."},
  { :user_id => 1, :title => 'A confession', :subtitle => 'I blame myself', :content => 'Yesterday was a productive day.'},
  { :user_id => 1, :title => 'Feature share', :subtitle => 'Where you learn that there are way too many ideas in my head.', :content => "Alright, heres the latest."},
  { :user_id => 1, :title => 'Baby steps', :subtitle => 'Else I might trip and hurt myself.', :content => 'So, you may have noticed...'}])

#  User.create( :name => 'Spaceghost', :email => 'johnneylee.rollins@gmail.com' )

