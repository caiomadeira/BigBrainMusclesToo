startscreen = {}
modescreen = require 'modescreen'
aboutscreen = require 'aboutscreen'
wStart = 0
hStart = 0
xStart = 0
yStart = 0
wSobre = 0
hSobre = 0
xSobre = 0
ySobre = 0
wQuit = 0
hQuit = 0
xQuit= 0
yQuit = 0


startscreen.state = true

startscreen.theme = function ()
  randomnumber =love.math.random(1,2)
  track1 = love.audio.newSource("BigBrain,musclesToo-jogo/Jogo/Musicas/Waltz.mp3","stream")
  track2 = love.audio.newSource("BigBrain,musclesToo-jogo/Jogo/Musicas/Lacrimosa.mp3","stream")
  if randomnumber == 1 then
    tracks = track1
  elseif randomnumber == 2 then
    tracks = track2
  end
  return tracks
end

 startscreen.mousepressed = function(x,y)
 if (xStart < x and xStart + wStart > x) and (yStart < y and yStart + hStart > y) then
    startscreen.state = false
    modescreen.state = true
  end
  if (xSobre < x and xSobre + wSobre > x) and (ySobre < y and ySobre + hSobre > y) then
    startscreen.state = false
    aboutscreen.state = true
  end
  if(xQuit < x and xQuit + wQuit > x) and (yQuit < y and yQuit + hQuit> y) then
    love.event.quit()
  end
end

startscreen.background = function(w, h)
  bg = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/fundonormal.png')
  BGwidth, BGheight = bg:getDimensions()
  love.graphics.draw(bg,0,0,0,w/BGwidth, h/BGheight)  
end

startscreen.title = function(w)
  title = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/logo2.png')
  Titlex,Titley = title:getDimensions()
  love.graphics.draw( title,w - Titlex/2.8,Titley/12,0,0.25,0.25 )
  return Titley/12
end

startscreen.start = function(w,h)
  start = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/botaoiniciar.png')
  wStart,hStart = start:getDimensions()
  xStart = w - 2*wStart
  yStart = 4*h + hStart/12
  love.graphics.draw(start,xStart, yStart)
end

startscreen.about = function (w,h)
  about = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/sobrebotao.png')
  wSobre,hSobre = about:getDimensions()
  xSobre = w - 2*wSobre
  ySobre = 4*h + 2*hStart + hSobre/12
  love.graphics.draw(about,xSobre, ySobre)
end
  
startscreen.quit = function(w,h)
  quit = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/sairbotao.png')
  wQuit,hQuit = quit:getDimensions()
  xQuit = w - 2*wQuit
  yQuit = 4*h + 2*hStart + 2*hSobre + hQuit/12
  --love.graphics.setColor(1,1,1)
  --love.graphics.rectangle('fill',xQuit,yQuit,wQuit,hQuit)
  --love.graphics.setColor(0,0,0)
  love.graphics.draw( quit,xQuit, yQuit)
end

startscreen.screen = function(w,h)
  love.graphics.setBackgroundColor(1,1,1,1)
  love.graphics.setColor(1,1,1,1)
  startscreen.background(w,h)
  titleY = startscreen.title(w, h)
  startscreen.start(w,titleY)
  startscreen.about(w,titleY)
  startscreen.quit(w,titleY)
end

return startscreen