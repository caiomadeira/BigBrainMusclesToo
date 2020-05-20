aboutscreen = {}

infoscreen = require 'infoscreen'

wAllan = 0
hAllan = 0
xAllan = 0
yAllan = 0

wTesla = 0
hTesla = 0
xTesla = 0
yTesla = 0

wCurie = 0
hCurie = 0
xCurie = 0
yCurie = 0

aboutscreen.state = false

aboutscreen.theme = function ()
  track = love.audio.newSource("BigBrain,musclesToo-jogo/Jogo/Musicas/spring.mp3","stream")
  return track
end

 aboutscreen.mousepressed = function(x,y, bt)
  if (xAllan < x and xAllan + wAllan > x) and (yAllan < y and yAllan + hAllan > y) and bt == 1 then
    aboutscreen.state = false
    infoscreen.state = true
    infoscreen.fighter = 'Allan'
  elseif bt == 2 then
    aboutscreen.state = false
    startscreen.state = true
  end
  
  if (xTesla < x and xTesla + wTesla > x) and (yTesla < y and yTesla + hTesla > y) and bt == 1 then
    aboutscreen.state = false
    infoscreen.state = true
    infoscreen.fighter = 'Tesla'
  elseif bt == 2 then
    aboutscreen.state = false
    startscreen.state = true
  end
  
  if (xCurie < x and xCurie + wCurie > x) and (yCurie < y and yCurie + hCurie > y) and bt == 1 then
    aboutscreen.state = false
    infoscreen.state = true
    infoscreen.fighter = 'Marie'
  elseif bt == 2 then
    aboutscreen.state = false
    startscreen.state = true
  end
end

aboutscreen.background = function(w, h)
  local bk = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/fundonormal.png')
  BGwidth, BGheight = bg:getDimensions()
  love.graphics.draw(bg,0,0,0,w/BGwidth, h/BGheight) 
end

aboutscreen.title = function(w)
  title = love.graphics.newText(bitcre48,'Quem quer conhecer?')
  Titlex,Titley = title:getDimensions()
  love.graphics.draw( title,w/2 - Titlex/2,Titley + 65)
  return Titley
end

aboutscreen.AlBut = function (w,h)
  -- botao do alan 
  AlBut = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/alanbotao.png')
  wAllan,hAllan = AlBut:getDimensions()
  xAllan = w/2 - wAllan/2
  yAllan = 3*h + hAllan
  love.graphics.draw(AlBut,xAllan, yAllan)
end 

aboutscreen.TesBut = function (w,h)
  --botao do tesla
  TesBut = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/teslabotao.png')
  wTesla, hTesla = TesBut:getDimensions()
  xTesla = xAllan
  yTesla = yAllan + 150
  love.graphics.draw(TesBut, xTesla, yTesla)
end

aboutscreen.CurBut = function (w,h)
  -- botao da curie
  CurBut = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/curiebotao.png')
  wCurie, hCurie = CurBut:getDimensions()
  xCurie = xTesla
  yCurie = yTesla + 150
  love.graphics.draw(CurBut, xCurie, yCurie)
end

aboutscreen.screen = function(w,h)
  aboutscreen.background(w,h)
  titleY = aboutscreen.title(w)
  aboutscreen.AlBut(w,titleY)
  aboutscreen.TesBut(w,titleY)
  aboutscreen.CurBut(w, titleY)
end

return aboutscreen