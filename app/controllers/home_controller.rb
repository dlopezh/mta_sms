class HomeController < ApplicationController

require 'open-uri'
require 'sanitize'

def index

filestring = ""

    f = open('http://www.mta.info/status/serviceStatus.txt')
    f.each {|line| filestring += line }
  
    filestring.gsub!(/&lt;/, "<").gsub!(/&gt;/, ">").gsub!(/&amp;nbsp;/, " ").gsub!(/&amp;/, "")
    
    doc = Nokogiri::HTML(filestring)


    time = doc.xpath('//service//timestamp')

    @last_update = Sanitize.clean!("#{time}")	

@lines = Line.all

end



end