Fighters = {}

Fighters.AllanTuring = {
  --AllanStop 
  love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Sprites/AlanTuring/Alanstop.png'),
  --AllanPortrait 
  love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Sprites/AlanTuring/Alan1choose.png'),
  
  --Info 
    love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/infoalan.png'),
  --nome 
  'Allan Turing',
  --HP  
  100,
  --x
  0,
  --y
  0,
  "Anima/Anima/Sprites/AlanTuring/AllanTuringFinal.png"
  }

Fighters.Tesla = {
  --Teslastop = 
  love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Sprites/NikolaTesla/Nikolastop.png'),
  --TeslaPot = 
  love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Sprites/NikolaTesla/nikolachoose.png'),
  --Info = 
  love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/infonikola.png'),
  --nome = 
  'Nikola Tesla',
  --HP = 
  100,
  --x
  0,
  --y
  0,
  'Anima/Anima/Sprites/NikolaTesla/Nikolafinal.png'
  }

Mariefull = love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Sprites/MarieCurie/Marierun.png')
Marieone = love.graphics.newQuad(0, 0, Mariefull:getWidth()/3, Mariefull:getHeight()/3, Mariefull:getDimensions())
Fighters.Marie = {
  --Mariestop = 
  {Mariefull, Marieone},
  --TeslaPot = 
  love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Sprites/MarieCurie/marieoficial.png'),
  --Info = 
  love.graphics.newImage('BigBrain,musclesToo-jogo/Jogo/Imagens/infomarie.png'),
  --nome = 
  'Marie Curie',
  --HP = 
  100,
  --x
  0,
  --y
  0,
  'Anima/Anima/Sprites/MarieCurie/Marierun.png'
  }

Newton = function()
  
end

Fighters.fighterlist = {Fighters.AllanTuring,Fighters.Tesla}
  

return Fighters