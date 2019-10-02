class TwilioService


  def webhook
    render :json => {:status => 200}

    end
  end

  # def callback
  #   # respond to the callback immediately with a 200
  #   render :nothing => true, :status => 200
  #
  #   # send data to be processed
  #   save_webhook_params(params)
  # end
  #
  # def save_webhook_params(params)
  #   @params = params
  #
  #   #slice and dice
  #   webhook_id = @params[:webhook_id]
  #   from = @params[:message_data][:addresses][:from][:email]
  #   to = @params[:message_data][:addresses][:to][0][:email]
  #   body = @params[:message_data][:bodies][0][:content]
  #   received = @params[:message_data][:date_received]
  #   date_format = Time.at(received).to_datetime
  #
  #   #save to DB
  #   @webhook = Webhook.new(webhookId: webhook_id, from: from, to: to, body: body, received: date_format)
  #   @webhook.save!
  # end
  #
  # def parse_json
  #   response = conn.get
  #   JSON.parse(response.body, symbolize_names: true)
  # end
  #
  # def exporting_data
  #   hashes = Array.new
  #   parse_json.each do |data|
  #   hash = {q: data[:body], radius: 2}
  #   hashes << hash
  # end
  # hashes
  # end
