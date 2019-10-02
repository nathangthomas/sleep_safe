class TwilioService

  def webhook
    render :json => {:status => 200}
  end
end
