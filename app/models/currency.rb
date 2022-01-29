class Currency < ApplicationRecord

  def calculate_value(amount)
    (current_price.to_f*amount.to_f).round(4)
  end


  def current_price
    url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest'
    headers = {
      'X-CMC_PRO_API_KEY' => "35d8e069-1f76-4777-8983-ed1ceb976e4f"
    }
    params = '?&slug='+ self.slug

    response = HTTParty.get(url+params, :headers => headers)['data'].to_a[0][1]['quote']['USD']['price']

  end

end
