#MTA STATUS SMS SERVICE

- Alerts mta users by sms of any delays or changes

###HEROKU
[MTA SMS SERVICE](http://pacific-castle-3368.herokuapp.com/)

###Description

My first working rails application. I use the [MTA's status page](http://web.mta.info/status/serviceStatus.txt) to update the information every 10 minutes. For sms delivery I am currently using the [Sendhub API](https://www.sendhub.com/developer/).

###Requirements & Dependencies

- Ruby >= 2.0.0
- [NokoGiri](http://nokogiri.org/)
  - To parse the MTA status page
- [HTTParty](https://github.com/jnunemaker/httparty)
  - For sending JSON to the SendHub API for sms delivery
