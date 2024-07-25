require 'sinatra'
require 'json'

# Carrega os dados dos arquivos JSON
PRODUCTS = JSON.parse(File.read('data/products.json'))
INFO = JSON.parse(File.read('data/info.json'))

# Rota para obter todos os produtos
get '/products' do
  content_type :json
  PRODUCTS.to_json
end
before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['GET'],
          'Access-Control-Allow-Headers' => 'Content-Type'
end

options '*' do
  200
end
# Rota para obter informações
get '/info' do
  content_type :json
  INFO.to_json
end

# Inicia o servidor na porta 4567 por padrão
set :port, 4567
