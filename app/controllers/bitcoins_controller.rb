class BitcoinsController < ApplicationController
   
    def bitcoin 
    end
    def bitcoinvalue
      Dotenv.load('.env')
      key = ENV['keymy']
      headers = { 
          "X-CMC_PRO_API_KEY" => key 
      }
      res = HTTParty.get(
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?convert=USD&slug=bitcoin", 
        :headers => headers
      )
       bit = res["data"]["1"]["quote"]["USD"]["price"]

       render json: bit
    end

    def chart
      if params[:timeper]
        chart =  getchart(params[:timeper])

        
      else
        chart = getchart("year")
      end

      render json: chart
    end

    private

    def getchart(timeper = "bitcyear")
    bitcyear =  {
        "December" => 16250,
        "January" => 12050,
        "February" => 15250,
        "March" => 13204,
        "April" => 18050,
        "May" => 19500,
        "June" => 17500,
        "July" => 18250,
        "August" => 19250,
        "September" => 18250,
        "October" => 19250,
        "November" => 17250,
    }

    bitcmonth =  {
      "day30" => 19250,
      "day1" => 16250,
      "day3" => 12050,
      "day6" => 15250,
      "day9" => 13204,
      "day12" => 18050,
      "day15" => 19500,
      "day18" => 17500,
      "day21" => 18250,
      "day24" => 19250,
      "day27" => 18250,
  }

  bitweek = {
      "Sat" => 18450,
      "Sun" => 18450,
      "Mon" => 18450,
        "Tue" => 18450,
        "Wed" => 18450,
       "Thur" => 18450,
      "Fri" => 19110,
  }

  bitday = {
    "18:00" => 19150,
    "20:00" => 19150,
    "22:00" => 19140,
    "00:00" => 19120,
    "02:00" => 19150,
    "04:00" => 19130,
    "06:00" => 19140,
    "8:00" => 18450,
    "10:00" => 18450,
    "12:00" => 18450,
    "14:00" => 18450,
    "16:00" => 18450,
  }
  bithour = {
  "16:05" => 19150,
  "16:10" => 19150,
  "16:15" => 19140,
  "16:20" => 19120,
  "16:25" => 19150,
  "16:30" => 19130,
  "16:35" => 19140,
  "16:40" => 19450,
  "16:45" => 19150,
  "16:50" => 19070,
  "16:55" => 19095,
  "17:00" => 19120
  }

  case timeper
  when "year"
    return bitcyear
  when "month"
    bitcmonth
  when "week"
    bitweek
  when "day"
    bitday
  when "hour"
    bithour
  else
    "no data"
  end

end

end