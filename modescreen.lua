modescreen = {}

choosescreen = require 'choosescreen'

wTrain = 0
hTrain = 0
xTrain = 0
yTrain = 0
wlocalPlay = 0
hlocalPlay = 0
xlocalPlay= 0
ylocalPlay = 0
wOnline = 0
hOnline = 0
xOnline= 0
yOnline = 0

modescreen.state = false

modescreen.background = function(w, h)
  love.graphics.setColor(1,1,1,1)
  bg = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/fundodesfocado.png')
  BGwidth, BGheight = bg:getDimensions()
  love.graphics.draw(bg,0,0,0,w/BGwidth, h/BGheight)  
end

modescreen.top = function(w)
  love.graphics.setColor(255,255,255)
  title = love.graphics.newText(bitcre48,'Escolha modo de jogo:')
  x,y = title:getDimensions()
  y = y 
  love.graphics.draw( title,(w/2) - x/2, 4*y)
  return y
end

modescreen.train = function(w,h)
  love.graphics.setColor(1,1,1)
  train = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/treino.png')
  wTrain,hTrain = train:getDimensions()
  xTrain = (w/2) - wTrain/2
  yTrain = 5*h + hTrain
  love.graphics.draw( train,xTrain, yTrain)
end

modescreen.localPlay = function(w,h)
  localPlay = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/localbotao.png')
  wlocalPlay,hlocalPlay = localPlay:getDimensions()
  xlocalPlay = (w/2) - wlocalPlay/2
  ylocalPlay = yTrain + 150
  love.graphics.draw( localPlay,xlocalPlay, ylocalPlay)
end

modescreen.Online = function(w,h)
  online = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/botaomultiplayer.png')
  wOnline,hOnline = online:getDimensions()
  xOnline = (w/2) - wOnline/2
  yOnline = ylocalPlay + 150
  love.graphics.draw( online,xOnline, yOnline)
end

modescreen.screen = function (w,h)
  modescreen.background(w,h)
  yTop = modescreen.top(w)
  modescreen.train(w,yTop)
  modescreen.localPlay(w,yTop)
  modescreen.Online(w,yTop)
end

modescreen.mousepressed = function(x,y, bt)
  if bt == 1 then
    if (xTrain < x and xTrain + wTrain > x) and (yTrain < y and yTrain + hTrain > y) then
      modescreen.state = false
      choosescreen.mode = 'Train'
      choosescreen.state = true
    
    elseif(xlocalPlay < x and xlocalPlay + wlocalPlay > x) and (ylocalPlay < y and ylocalPlay + hlocalPlay> y) then
      modescreen.state = false
      choosescreen.mode = 'localPlay'
      choosescreen.state = true
    
    elseif(xOnline < x and xOnline + wOnline > x) and (yOnline < y and yOnline + hOnline> y) then
      modescreen.state = false
      choosescreen.mode = 'Online'
      choosescreen.state = true
      choosescreen.textbox.active = true
    end
  elseif bt == 2 then
    modescreen.state = false
    startscreen.state = true
  end
end

return modescreen