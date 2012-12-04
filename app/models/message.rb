#encoding: utf-8
require 'net/http'
class Message < ActiveRecord::Base
  belongs_to :client
  attr_accessible :text, :client_id

  after_save :sms

  def Send( smsmail, smstext )
	uri = URI('http://api.smsfeedback.ru/send')
	            params = { :login => 'mgerasim', :password => 'zaq12wsx', :phone => smsmail, :text => text, :sender => 'MCPIR.RU'}
	            uri.query = URI.encode_www_form(params)
	 
	 
	        res = Net::HTTP.get_response(uri)
	            puts res.body if res.is_a?(Net::HTTPSuccess)

	end

	def sms
	Send(client.smsmail, text)
	end


end
