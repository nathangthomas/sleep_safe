#Sleep Safe

Sleep Safe is app inspired by Denver, CO's Initiative 300, dubbed "Right to Survive", which if passed would have overturned Denver's anti-camping ordinance. This bill did not pass in turn making it illegal for anyone to 'camp' or even wear a blanket in public.

Initiative 300 effectively criminalizes the homeless and we aim to help everyone have shelter and a safe place to sleep when they need it.

Sleep Safe provides a service to allow anyone with access to even a basic phone without data to search their area for nearby shelters and community building events. Anyone can text a zipcode to our number and receive a response with the two closest shelters and contact information.The same functionality is also available on our web based application in addition to nearby event and maps.

Users can also choose to make an account where in future iterations they will be able to opt in for a service that will automatically send out alerts to make preparations when the weather is forecasted to drop below 40 degrees.  

Sleep Safe is brought to you by:
- Tay DeHerrera
- Rene Casco
- Will Thompson
- Nathan Thomas

Interact with Sleep Safe (add link here)

#Built Using
- Rails
- Ruby
- Google and Twillio APIs
- PostgreSQL database
- Sinatra to host a mico-service API that manages a Twillio

Check out the Sinatra microservice's repo here (add link here)

- Sinatra 2.0.7
- Twillio-ruby 5.26.0

# Run Sleep Safe on your local machine
1. $ git clone git@github.com:nathangthomas/sleep_safe.git
2. $ bundle
3. $ bundle exec figaro install -- add your API keys to config/application.yml:

GOOGLE_PLACES_API_KEY: "<your Google Places API key>"
AUTHY_API_KEY: "<your Authy API key>"
YOUR_ACCESS_KEY: "<your access key>"
API_SIGNING_KEY: "<your API signing key>"
PRODUCTION_API_KEY: "<your production API key>"
TWILIO_ACCOUNT_SID: "<your Twillio Account SID>"

4. $ bundle exec rspec install
5. $ rails db:{create,migrate}
6. You can run test suite with $ bundle exec rspec
7. Start a local server with $ rails s -- access Sleep Safe in your browser or Postman at localhost:3000
