# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# lines = ["123", "456", "7", "ACE", "BDFM", "G", "JZ", "L", "NQR", "S", "SIR"]

# lines.each do |line|
# 	Line.create(name: line)
# end

    #Opens and Cleans XML

    require 'open-uri'
	require 'sanitize'

    filestring = ""
    f = open('http://www.mta.info/status/serviceStatus.txt')
    f.each {|line| filestring += line }
    filestring.gsub!(/&lt;/, "<").gsub!(/&gt;/, ">").gsub!(/&amp;nbsp;/, " ").gsub!(/&amp;/, "")

    #Parse XML
    doc = Nokogiri::HTML(filestring)

    #Returns last update time
    time = doc.xpath('//service//timestamp')
    last_update = Sanitize.clean!("#{time}")

    #RETURNS LINES ARRAY
    lines =[] 
    names = doc.xpath('//subway//name').map {|name| name}
    names.each do |name|
    clean_name = Sanitize.clean!("#{name}")
    lines << clean_name
    end

    #RETURNS STATUS ARRAY
    line_status = []
    status = doc.xpath('//subway//name').map {|name| name.next_sibling.text}
    status.each do |status|
    line_status << status
    end

    #RETURNS DESCRIPTION ARRAY
    status_description = doc.xpath('//subway//name').map {|name| name.next_sibling.next_sibling.text.split("\n").drop(2)}

    description =[]
    status_description.each do |status|
    description << status
    end

    lines.each_with_index do |thing, index|
    	Line.create(name: lines[index], status: status[index], description: description[index])
    end