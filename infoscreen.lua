infoscreen = {}

Fighters = require 'Fighters'

infoscreen.state = false
infoscreen.fighter = ''

local Allan = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/infoalan.png')
local Tesla = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/infonikola.png')
local Marie = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/infomarie.png')


infoscreen.screen = function (w,h)
  if infoscreen.fighter == 'Allan' then
    love.graphics.draw(Allan, 0, 0, 0, w/Allan:getWidth(), h/Allan:getHeight())
    
  elseif infoscreen.fighter == 'Tesla' then
    love.graphics.draw(Tesla, 0, 0, 0, w/Tesla:getWidth(), h/Tesla:getHeight())
    
  elseif infoscreen.fighter == 'Marie' then
    love.graphics.draw(Marie, 0, 0, 0, w/Marie:getWidth(), h/Marie:getHeight())
  end
end

infoscreen.mousepressed = function(x,y,bt)
  if bt == 2 then
    infoscreen.state = false
    aboutscreen.state = true
  end
end

return infoscreen