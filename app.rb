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

get('/words/new') do
  erb(:word_form)
end

get('/words') do
  @words = Word.all
  erb(:index)
end

post('/words') do
  word = params.fetch('word')
  language = params.fetch('language')
  origin = params.fetch('origin')
  @word = Word.new(word, language, origin).save
  @words = Word.all
  erb(:success)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i)
  erb(:word)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:word)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:definition_form)
end

post('/definitions') do
  definition = params.fetch('definition')
  @definition = Definition.new(definition).save
  @word = Word.find(params.fetch('word_id').to_i)
  @word.add_definition(@definition)
  erb(:success)
end
