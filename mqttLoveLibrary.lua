--[[
   mqtt module for löve
]]
mqttLove = require("mqtt")

local PORT = 1883

local mqttClient
local defaultTopic 

MQTT = {}


--[[
	function to start the mqttClient. It connects to the broker and subscribes to a predefined channel.
	id: unique id for the user
	callbackFunction: optional, function to be called when the application receives a message. 
					  If nil, function stored  in 'messageReceived' will be called
]]
function MQTT.start(host, id, listchannel, callbackFunction)
  callback = callbackFunction or messageReceived
  defaultTopic = id .. 'node'
  listchannel = listchannel or id..'love'
  mqttClient = mqttLove.client.create(host, PORT, function (topic , message)
		print("received message " .. message .. " from topic " .. topic)
		callback(message)
	end) 
  connectErrorMessage = mqttClient:connect(id..'love') 
  if(connectErrorMessage) then
    print("Error connecting! "..connectErrorMessage)
  end
  mqttClient:subscribe({listchannel})
  print("connecting to " .. listchannel)
end

--[[
	function to send a message
	message: message to be sent
	topic: optional, channel to send the message. If nil the message will be sent to a default channel
]]
function MQTT.sendMessage(message,topic)
  topic = topic or defaultTopic -- default topic for publishing
  mqttClient:publish(topic,message)
  print ("sending message ".. message .. " to topic " .. topic)
end

--[[
	function to check if messages were received in the subscribed channels
]]
function MQTT.checkMessages()
	errorMessage = mqttClient:handler()
	if(errorMessage) then
		print("Error checking for messages! "..errorMessage)
	end
end

return(MQTT)
