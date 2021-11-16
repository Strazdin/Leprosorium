#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "Leprosorium.db"}

class Comments < ActiveRecord::Base

end

class Posts < ActiveRecord::Base
	
end
	# before вызывается каждый раз при перезагрузке
	# любой страницы

before do
	# инициализация БД


end

	# configure вызывается каждый раз при конфигурации приложения:
	# когда изменился код программы И перезагрузилась страница

configure do
	# инициализация БД


	# Создает таблицу если таблица существует

end

get '/' do
	# выбираем список постов из БД


	erb :index
end

	# обработчик get-запроса /new
	# (браузер получает страницу с сервера)


get '/new' do
	erb :new
end

	# обработчик post - запроса /new
	# (браузер отправляет данные на сервер)

post '/new' do
	# получаем переменную из post-запроса


	# сохранение данных в БД



	# перенаправление на главную страницу

	redirect to '/'
end

# вывод информации о посте (универсальный обработчик) :post_id - получаем параметр из url

get '/details/:post_id' do
	# получаем переменную из url'a


	# получаем список постов
	# (у нас будет только один пост)

	
	# выбираем этот один пост в переменную @row


	# выбираем комментарии для нашего поста



	# возвращаем представление details.erb
	erb :details
end

# обработчик post-запроса /details/
# (браузер отправляет данные на сервер, мы их принимаем)

post '/details/:post_id' do
	# получаем переменную из url'a

	# получаем переменную из post-запроса

	# сохранение данных в БД


	# перенаправление на страницу поста

end