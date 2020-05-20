fightscreen = {}

fightscreen.state = false
local gameover

cena = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/cenario2.png')

fightscreen.screen = function(w, h)
  love.graphics.draw(cena, 0, 0, 0, w/cena:getWidth(),h/cena:getHeight())
  if not gameover and (Fighters.fighterlist[choosescreen.players.player1[2]][5] <= 0 or Fighters.fighterlist[choosescreen.players.player1[2]][5] <= 0) then
    gameover = true
    player1.gameover = true
    Fighters.fighterlist[choosescreen.players.player1[2]][5] = 100
    Fighters.fighterlist[choosescreen.players.player2[2]][5] = 100
    table.remove(choosescreen.players.player1,2)
    table.remove(choosescreen.players.player2,2)
  end
  if gameover then
    love.graphics.setColor(0,0,0)
    love.graphics.printf('Game Over, aperte esc para ir a tela inicial',bitcre48, w/3,y/2,w)
    love.graphics.setColor(1,1,1,1)
    choosescreen.players.player1[1] = false
    choosescreen.players.player2[1] = false
  else
    love.graphics.rectangle('line', 0, 0, w/2, h/8)
    love.graphics.rectangle('line', w/2, 0, w/2, h/8)
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.rectangle('fill', 3, 3, w/2*(Fighters.fighterlist[choosescreen.players.player1[2]][5]/100),h/8 - 3)
    love.graphics.rectangle('fill', w/2 + 3, 3, w/2*(Fighters.fighterlist[choosescreen.players.player2[2]][5]/100),h/8 - 3)
    love.graphics.setColor(1,1,1,1)
  end
end

fightscreen.keypressed = function(key)
  if key == 'escape'  and gameover then
    fightscreen.state = false
    startscreen.state = true
  end
end
  

return fightscreen