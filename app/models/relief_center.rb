class ReliefCenter < ActiveRecord::Base
  attr_accessible :description, :latitude, :longitude, :name, :password, :email

  # A S S O C I A T I O N S
  has_many :events

  # V A L I D A T I O N S
  validates_numericality_of :latitude, :longitude, :allow_nil => true
  validates_presence_of :name

  class << self
    def create_from_auth(auth)
      create! do |user|
        info            = auth["info"]
        user.provider   = auth["provider"]
        user.uid        = auth["uid"].to_s
        user.name       = info["name"]
        user.email      = info["email"]
      end
    end
    
    def send_updates(contact_number, text_message)
      
      result = [];
      
      client = Savon.client do
        wsdl 'http://iplaypen.globelabs.com.ph:1881/axis2/services/Platform?wsdl'
        encoding 'UTF-8'
        #endpoint 'http://iplaypen.globelabs.com.ph:1881/axis2/services/Platform/'
        #namespace 'http://ESCPlatform/xsd/'
      end
      
      
      response = client.call(:send_sms) do
        message uName: 'i5731u0pt', uPin: '21737742', MSISDN: contact_number.to_s, messageString: text_message.to_s, Display: '1', udh: '', mwi: '', coding: '0'
      end
     
      res = response.body
      if res[:send_sms_response][:return] == '201'
        result.push(:result => true, :message => "Message Sent successfully")
      else
        result.push(:result => false, :message => "Service responeded with #{res[:send_sms_response][:return]}")
      end
      puts result
      #put result.to_s
      return {:result => result}
    
      #rescue Savon::SOAPFault => e
       # Rails.logger.info e.backtrace
        #return {:result => false, :error => "Constructor error"}
    
    end
  end
end
