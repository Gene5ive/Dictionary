require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')
require('pry')

get('/') do
  @words = Word.all
  erb(:index)
end

get('/word/new') do
  erb(:word_form)
end

get('/words') do
  @words = Word.all
  erb(:index)
end

post('/word') do
  word = params.fetch('word')
  language = params.fetch('language')
  origin = params.fetch('origin')
  @word = Word.new(word, language, origin).save
  @words = Word.all
  erb(:success)
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:word)
end
