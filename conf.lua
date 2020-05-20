-------configurações do projeto
function love.conf(t)
  t.identity = nil
  t.version = "11.2"
  t.console = true -- abrir o console (cmd) - é importante para testes
  t.accelerometerjoystick = true 
  t.externalstorage = false 
  t.gammacorrect = false
  ---- configurações da janela 
  t.window.title = "Bid Brain, Muscles too" -- nome da janela
  t.window.icon = nil -- icone
  t.window.width = 1980 -- largura
  t.window.height = 1080  --- altura
  t.window.borderless = true -- bordas na janela
  t.window.resizable = true -- maximizar a janela
  t.window.minwidth = 1
  t.window.minheight = 1
  t.window.fullscreen = false -- tela cheia
  t.window.fullscreentype = "desktop" -- recomenda desktop pois é compativel c outros OS
  t.window.vsync = true -- sincronização vertical
  t.window.msaa = 0 -- quantidade de amostras
  t.window.display = 1 -- mais de um monitor
  t.window.highdpi = false -- quando testamos para MAC ou IOS em tela retina
  t.window.x = nil
  t.window.y = nil
  --------- modulos dos recursos
  t.modules.audio = true -- ativa os recursos de audio
  t.modules.event = true -- teclas pressionadas
  t.modules.graphics = true -- renderização de graficos
  t.modules.image = true -- habilita adição de imagens
  t.modules.joystick = true -- pode-se usar um controle
  t.modules.keyboard = true -- habilita o uso do teclado
  t.modules.math = true -- para calculos matematicos
  t.modules.mouse = true -- uso do mouse
  t.modules.physics = true -- simulação de fisica 
  t.modules.sound = true -- habilita a decodificação p arq de sons
  t.modules.system = true  
  t.modules.timer = true
  t.modules.touch = true -- toque na tela
  t.modules.video = true -- arq de videos
  t.modules.window = true
  t.modules.thread = true -- habilita as threads - processos paralelos 
end