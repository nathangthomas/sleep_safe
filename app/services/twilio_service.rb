class TwilioService

  def conn
  conn = Faraday.new(:url => 'http://localhost:9292')
  end

  def parse_json
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def exporting_data
    hashes = Array.new
    parse_json.each do |data|
    hash = {q: data[:body], radius: 2}
    hashes << hash
  end
  hashes
  binding.pry
  end
end
