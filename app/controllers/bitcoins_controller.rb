class BitcoinsController < ApplicationController
   
    def bitcoin
        Dotenv.load('.env')
        
        key = ENV['keymy']
          headers = { 
            "X-CMC_PRO_API_KEY" => key 
          }
          res = HTTParty.get(
            "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?convert=USD&slug=bitcoin", 
            :headers => headers
          )
          @bit = res["data"]["1"]["quote"]["USD"]["price"]
    end


end