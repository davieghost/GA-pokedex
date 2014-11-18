class PagesController < ApplicationController
	def home
		@result = HTTParty.get('http://pokeapi.co/api/v1/pokedex/')['objects'][0]['pokemon']
	end
	def result

		@pokemon_name = params['name']

			gif = params['name']

			url_safe_gif = gif.gsub(' ', '+')
			url = "http://api.giphy.com/v1/gifs/search?q=#{url_safe_gif}+pokemon&api_key=dc6zaTOxFJmzC"
			resp = HTTParty.get(url)
			
			@image = resp['data'].sample['images']['original']['url']

			url_poke = "http://pokeapi.co/api/v1/pokemon/#{params['name']}"
		 	test = HTTParty.get(url_poke)
		 	@attack = test['abilities'][0]['name']
	end
end