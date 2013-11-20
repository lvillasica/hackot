class SmsSoap
  extend Savon::Model
  
  client endpoint: "http://iplaypen.globelabs.com.ph:1881/axis2/services/Platform/", namespace: "http://ESCPlatform/xsd"
  
  def send(contact_number, text_message)
    
  end
  
end