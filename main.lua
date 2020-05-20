startscreen = require 'startscreen'
--modescreen = require 'modescreen'
msgr = require('mqttLoveLibrary')

player1 = require 'Anima/Anima/player1'

local user = string.char(math.random(0,25) + 65,math.random(0,25) + 97)
local channel = ''
channelactive = false

w, h = love.graphics.getDimensions()

local function mensagemRecebida(mensagem)
  if choosescreen.mode == 'Online' then
    youser,state, index = string.match(mensagem,'<%s><%s><%d>')
    if youser ~= user then
      choosescreen.mensagemRecebida(state,index)
    end
  end
end

function love.load()
  math.randomseed(os.time())
  love.window.setFullscreen(true)
  w, h = love.graphics.getDimensions()
  arial16 = love.graphics.newFont('BigBrain,musclesToo-jogo/Jogo/Fonte/Arial.ttf', 16)
  arial24 = love.graphics.newFont('BigBrain,musclesToo-jogo/Jogo/Fonte/Arial.ttf', 24)
  arial32 = love.graphics.newFont('BigBrain,musclesToo-jogo/Jogo/Fonte/Arial.ttf', 32)
  bitcre32 = love.graphics.newFont('BigBrain,musclesToo-jogo/Jogo/Fonte/bitcre.ttf', 32)
  arial48 = love.graphics.newFont('BigBrain,musclesToo-jogo/Jogo/Fonte/Arial.ttf', 48)
  bitcre48 = love.graphics.newFont('BigBrain,musclesToo-jogo/Jogo/Fonte/bitcre.ttf', 48)
  player2.load()
  player1.load()
  starttheme = startscreen.theme()
  aboutheme = aboutscreen.theme()
end

function love.draw()
  if startscreen.state then
    startscreen.screen(w,h)
    
  elseif aboutscreen.state then
    aboutscreen.screen(w,h)
  
  elseif infoscreen.state then
    infoscreen.screen(w,h)
    
  elseif modescreen.state then
    modescreen.screen(w,h)
  
  elseif choosescreen.state then
    choosescreen.screen(w,h)
  
  
elseif fightscreen.state then
    fightscreen.screen(w, h)
    player1.draw()
    player2.draw()
  end
end

function love.mousepressed(x,y,bt)
  if startscreen.state then
    startscreen.mousepressed(x,y)
    
  elseif aboutscreen.state then
    aboutscreen.mousepressed(x,y,bt)
    
  elseif infoscreen.state then
    infoscreen.mousepressed(x,y,bt)
    
  elseif modescreen.state then
    modescreen.mousepressed(x,y,bt)

  elseif choosescreen.state then
    choosescreen.mousepressed(x,y,bt)
  end
end

function love.keypressed(key)
  if choosescreen.state then
    choosescreen.keypressed(key)
  end
  if fightscreen.state then
    fightscreen.keypressed(key)
    player1.keypressed(key)
    player2.keypressed(key)
  end
end

function love.textinput(text)
  if choosescreen.textbox.active then
    choosescreen.textinput(text)
  end
end


function love.update(dt)
  if choosescreen.mode == 'Online' and channelactive then
    msgr.checkMessages()
  end
  
  if channel ~= '' and not channelactive then
    msgr.start("test.mosquitto.org", user, channel,  mensagemRecebida)
    channelactive = true
  end
  if choosescreen.mode == 'Online' and channelactive  and choosescreen.players.player1[1] then
    message = ''
    if choosescreen.players.player1[1] then
    message = string.format('<%s><%s><%d>',user,'true' , choosescreen.players.player1[2])
    else
      message = string.format('<%s><%s><%d>',user,'false' , choosescreen.players.player1[2])
    end
    msgr.sendMessage(message,channel)
  end
  if startscreen.state == true then
    starttheme:play()
  else
    starttheme:stop()
  end
  if aboutscreen.state or infoscreen.state then
    aboutheme:play()
  else
    aboutheme:stop()
  end
  if choosescreen.state then
    choosescreen.update()
  end
  
  if fightscreen.state then
    player1.update(w, dt)
    player2.update(w, dt)
  end
  
end