choosescreen = {}

Fighters = require 'Fighters'
fightscreen = require'fightscreen'

choosescreen.state = false
choosescreen.mode = ''
larg = 0
alt = 0

choosescreen.textbox = {
  channel = '',
  active = false,
  colors = {
    background = {0,0,0},
    text = {1,1,1}
  }
}

portraits = {}
choosescreen.players = {player1 = {false}, player2 = {false}}
ready = nil

choosescreen.textinput = function(text)
  if choosescreen.textbox.active then
    choosescreen.textbox.channel = choosescreen.textbox.channel..text
  end
end

choosescreen.background = function(w, h)
  love.graphics.setColor(1,1,1,1)
  bg = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/fundodesfocado.png')
  BGwidth, BGheight = bg:getDimensions()
  love.graphics.draw(bg,0,0,0,w/BGwidth, h/BGheight)  
end

choosescreen.top = function(w, h)
  -- Escreve o titulo da pagina
  title = love.graphics.newText(bitcre32, 'Escolha seu cerebro')
  x,y = title:getDimensions()
  love.graphics.draw(title, w/2 - x/2, 200)
  return y
end
choosescreen.portraits = function(w, y, h)
  --Cria os icones dos personagens se nao existirem
  if #portraits < #Fighters.fighterlist then
    for i = 1, #Fighters.fighterlist do
      color = {1, 1, 1, 1}
      Fighter = Fighters.fighterlist[i]
      nome = Fighter[4]
      Fighterw, Fighterh = Fighter[2]:getDimensions()
      Fighterw = Fighterw
      Fighterh = Fighterh
      j = 1
      In = i
      if i == 3 then
        j = 2
        In = 1
      elseif i == 4 then
        j = 2
        In = 2
      end
      table.insert(portraits, {width = Fighterw, height = Fighterh,posX = w/3 + (In-1)*Fighterw, posY = 2*y + (j - 1)*Fighterh, picture = Fighter, name = nome, color = color})
    end
  end
  --mostra os personagens
  for i = 1, #Fighters.fighterlist do
    love.graphics.setColor(portraits[i].color)
    love.graphics.draw(portraits[i].picture[2], portraits[i].posX,portraits[i].posY)
    --[[ Para fazer 2 para um lado e dois para o outro...
    if i%2 == 0 then
      love.graphics.draw(portraits[i].picture[1],portraits[i].picture[2], portraits[i].posX, portraits[i].posY,0,0.25,0.25)
    else
      love.graphics.draw(portraits[i].picture[1],portraits[i].picture[2], portraits[i].posX + portraits[i].width, portraits[i].posY,0,-0.25,0.25)
    end
    ]]
  end
end

choosescreen.mousepressed = function(x,y,bt)
  w = larg
  h = alt
  for i = 1, #Fighters.fighterlist do
    if ready then
      --Se os dois tiveream escolhidos e clicarem com o botao esquerdo vai para a proxima tela
      if bt == 1 --[[and ((ready.x < x and ready.x + ready.x*ready.scale > x) and (ready.y < y and ready.y + ready.y*ready.scale > y))]] then
        choosescreen.state = false
        fightscreen.state = true
        player1.playerimagem = love.graphics.newImage(Fighters.fighterlist[choosescreen.players.player1[2]][8])
        player1.g = anim.newGrid ( 360, 333, player1.playerimagem:getWidth(), player1.playerimagem:getHeight())
        player1.playerparado = anim.newAnimation(player1.g('1-4', 1, '1-4', 2), 0.08)
        player1.playercorrendo = anim.newAnimation(player1.g('1-4', 3, '1-4', 4), 0.07)
        player1.playersoco = anim.newAnimation(player1.g('1-2', 5, '1-2', 6), 0.07)
        player2.playerimagem = love.graphics.newImage(Fighters.fighterlist[choosescreen.players.player2[2]][8])
        player2.g = anim.newGrid ( 360, 333, player2.playerimagem:getWidth(), player2.playerimagem:getHeight())
        player2.playerparado = anim.newAnimation(player2.g('1-4', 1, '1-4', 2), 0.08)
        player2.playercorrendo = anim.newAnimation(player2.g('1-4', 3, '1-4', 4), 0.07)
        player2.playersoco = anim.newAnimation(player1.g('1-2', 5, '1-2', 6), 0.07)
      --Mas se clicar com o botão direito escolhe o jogador novamente
      elseif bt == 2 then
        if choosescreen.mode == 'localPlay' or choosescreen.mode == 'Train' then
          table.remove(choosescreen.players.player1,2)
          table.remove(choosescreen.players.player2,2)
          choosescreen.players.player1[1] = false
          choosescreen.players.player2[1] = false
        end
        ready = nil
      end      
    else
      if bt == 2 then
        choosescreen.state = false
        choosescreen.mode = ''
        modescreen.state = true
      else
        --Se a caixa de texto nao estiver ativa (para botar o canal) e o clique for dentro dela:
        if not choosescreen.textbox.active then            
        --Se tiver alguem que nao escolheu o clique indica quem ira escolher, o player 1 primeiro e o player 2 depois
          if (portraits[i].posX < x and portraits[i].posX + portraits[i].width > x) and (portraits[i].posY < y and portraits[i].posY + portraits[i].height > y) then
            --Se o player 1 nao tiver escolhido o clique eh a escolha do player 1
            if not choosescreen.players.player1[1] then
              table.insert(choosescreen.players.player1, i)
              choosescreen.players.player1[1] = true
              --Se o modo for treino, o computador escolhe um lutador aleatorio
              if choosescreen.mode == 'Train' then
                table.insert(choosescreen.players.player2, math.random(1,4))
                choosescreen.players.player2[1] = true
                ready = true
              elseif choosescreen.mode == 'Online' then
                choosescreen.players.player2[1] = true
              end
            --Se o modo for multiplayer local e o player 2 nao tiver escolhido mas o player 1 sim, o clique eh a escolha do player 2
            elseif choosescreen.mode == 'localPlay' and choosescreen.players.player1[1]  and not choosescreen.players.player2[1] then
              table.insert(choosescreen.players.player2, i)
              choosescreen.players.player2[1] = true
              ready = true
            end
          end
        end
      end
    end
  end
end

choosescreen.keypressed = function(key)
  if key == 'return' then
    choosescreen.textbox.active = false
    channel = choosescreen.textbox.channel
  end
end

choosescreen.screen = function (w,h)
  choosescreen.background(w, h)
  y = choosescreen.top(w)
  choosescreen.portraits(w,y,h)
  larg = w
  alt = h
  --Cria a caixa de texto e mostra o que est[a nela:
  if choosescreen.textbox.active then
    love.graphics.setColor(unpack(choosescreen.textbox.colors.background))
    love.graphics.print('Bote o canal que deseja criar ou se conectar! Enter para confirmar',w/3,h/4)
    love.graphics.rectangle('fill', w/3, h/3,300, 100)
    love.graphics.setColor(unpack(choosescreen.textbox.colors.text))
    love.graphics.printf(choosescreen.textbox.channel,w/3, h/3,w/3, 'left')
  end
  
  --Flair
  flair = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/barra.png')
  flairw, flairh = flair:getDimensions()
  flairh = flairh
  love.graphics.draw(flair, 0, h - flairh,0,w/flairw,1) 
  -- Escreve o nome do lutador escolhido pelo jogador 1
  if #choosescreen.players.player1 > 1 then
    local i = choosescreen.players.player1[2]
    p1 = love.graphics.newText(arial32, portraits[i].name)
    x,y = p1:getDimensions()
    love.graphics.setColor(1,1,1,1)
    if Fighters.fighterlist[i][4] ~= 'Marie Curie' then
      local Fw,Fh = Fighters.fighterlist[i][1]:getDimensions()
      love.graphics.draw(Fighters.fighterlist[i][1], 0, h - y - Fh)
    else
      local Fw,Fh = Fighters.fighterlist[i][1][2]:getTextureDimensions()
      love.graphics.draw(unpack(Fighters.fighterlist[i][1]), 0, h - y - Fh)
    end
    love.graphics.setColor(0,0,0)
    love.graphics.draw( p1,x/2, h - y)
  end
  -- Escreve o nome do lutador escolhido pelo jogador 2
  if #choosescreen.players.player2 > 1 then
    local j = choosescreen.players.player2[2]
    p2 = love.graphics.newText(arial32, portraits[j].name)
    x2,y2 = p2:getDimensions()
    love.graphics.setColor(1,1,1,1)
    if Fighters.fighterlist[j][4] ~= 'Marie Curie' then
      local Fw,Fh = Fighters.fighterlist[j][1]:getDimensions()
      love.graphics.draw(Fighters.fighterlist[j][1], w - Fw/8, h - y - Fh, 0, -1, 1)
    else
      local Fw,Fh = Fighters.fighterlist[j][1][2]:getTextureDimensions()
      love.graphics.draw(Fighters.fighterlist[j][1][1],Fighters.fighterlist[j][1][2], w - Fw/8, h - y - Fh, 0, -1, 1)
    end
    love.graphics.setColor(0,0,0)
    love.graphics.draw( p2, w - 1.5*x, h - y)
  end
end 

choosescreen.MensagemRecebida = function(state,index)
  if state == true then
    choosescreen.players.player2 = {true, index}
  else
    choosescreen.players.player2 = {false, index}
  end
end

choosescreen.update = function()
  if choosescreen.players.player1[0] and choosescreen.players.player2[0] then
    ready = true
  end
end
return choosescreen