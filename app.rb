#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "Leprosorium.db"}
class Comment < ActiveRecord::Base
	belongs_to :post
end

class Post < ActiveRecord::Base
	has_many :comments
end
	# before вызывается каждый раз при перезагрузке
	# любой страницы

before do
	@results = Post.all.order('created_at DESC')
	#@comment = Comment.where(post_id: @results.id)
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

post '/new' do
	# получаем переменные из post-запроса
	# сохранение данных в БД
	@p = Post.new params[:post]
	@p.save





	# перенаправление на главную страницу

	redirect to '/'
end

# вывод информации о посте (универсальный обработчик) :post_id - получаем параметр из url

get '/details/:id' do
	# получаем переменную из url'a
	@res = Post.find(params[:id])
	@results_comment = Comment.where(post_id: @res.id).order('created_at DESC')
	#@comment = Comment.where(post_id: @res.id)
	#erb "#{@res.methods}"
	# получаем список постов
	# (у нас будет только один пост)

	# выбираем этот один пост в переменную @row


	# выбираем комментарии для нашего поста



	# возвращаем представление details.erb
	erb :details
end

# обработчик post-запроса /details/
# (браузер отправляет данные на сервер, мы их принимаем)

post '/details/:id' do
	@res = Post.find(params[:id])
	@c = Comment.new params[:comment]
	@c.post_id = @res.id
	@c.save
	@results_comment = Comment.where(post_id: @res.id).order('created_at DESC')
	erb :details
end