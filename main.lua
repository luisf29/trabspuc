require("elevator")
require("andares")

function love.load()
  font = love.graphics.newFont("arial_narrow_7.ttf", 17) -- Fonte usada
  Elevator:load() -- Dados de posiçao do elevador
  Andar:load()
  ligado = false
  a = 138/255
  b = 103/255
  c = 224/255

end

function love.mousepressed(x , y, button)
if button == 1 then
    if x >= 315 and x <= 315 + 20 and  y >= 490 and y <= 490 + 20 then
    move = true
    move1 = false
    end
  if x >= 315 and x <= 315 + 20 and  y >= 500 and y <= 500 + 20 then
    move1 = true
    move = false
    end
  if x >= 315 and x <= 315 + 20 and  y >= 190 and y <= 190 + 20 then
    move = true
    move1 = false
    end
  if x >= 315 and x <= 315 + 20 and  y >= 200 and y <= 200 + 20 then
    move1 = true
    move = false
  end
end
end 
function love.mousepressed(x , y, button)
  if button == 1 then -- liga e desliga a lampada
    if x >= 258 and x <= 268 and y >= 508 and y <= 518 then
    turnon = not turnon
    end
  end
end
function love.keypressed(key)
  if key == "space" then
    abrir = not abrir
  end
end
function love.keyreleased(key)
  if key == "w"or key == "s" or key =="up" or key == "down" or "space" then
    vel_y = 0
  end
end

function love.update(dt)
  if turnon == true then
    a = a + 0.35
    b = b + 0.54
    c = c - 0.79
  elseif turnon == false then
    a = 138/255
    b = 103/255
    c = 224/255
  end
  Elevator:update(dt)
end
 
function desenha_chão()
love.graphics.setColor(55/255, 82/255, 78/255)
love.graphics.rectangle("fill",  0  , 575, 800, 25)
end
function desenha_janela(x, y) -- Essa função facilita a criação de uma love.graphics.line
love.graphics.setColor(5/255, 240/255, 240/255) --Azul Claro
    love.graphics.rectangle("fill" ,x ,y ,100, 100)
love.graphics.setColor(0, 0, 0) -- Cor da garde da janela (Preto)
    love.graphics.line(x +50, y, x + 50, y +100)
    love.graphics.line(x , y + 50, x + 100, y +50)
love.graphics.setColor(1, 1, 1) -- Cor do Reflexo das Janelas (Preto)
    love.graphics.line(x + 15, y + 6 , x + 5 , y + 20)
    love.graphics.line(x +20 , y + 9  , x + 10 , y +23)
end
 
function desenha_botoes()
  love.graphics.setColor(138/255, 103/255, 224/255) -- Cor do botão (rosa)
    love.graphics.polygon("fill" ,315 , 500 , 320,  480, 325, 500)
    love.graphics.polygon("fill" ,315, 505 , 320,  525, 325, 505)
  end
  
function desenha_abajur()
 -- Abajur
love.graphics.setColor(a, b, c) -- Cor do Abajur (Rosa)
    love.graphics.rectangle("fill", 258 ,508 , 10 , 10 )
    love.graphics.setColor(0,0,0) -- Cor da barrinha do abajur (preto)
    love.graphics.rectangle("fill", 262 ,523 , 2 , -5 )
-- Jarra do vaso (Branco)
love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill", 260 ,540 , 6 , -17 )
  end
function desenha_movel_abajur()
love.graphics.setColor(61/255, 30/255, 7/255) -- Cor do movel (marrom)
    love.graphics.rectangle("fill", 220 ,540 , 60, 17)
    love.graphics.rectangle("fill", 220 ,540 , 4, 35)
    love.graphics.rectangle("fill", 280 ,540 , 4, 35)
  end
function desenha_corrente()
love.graphics.setColor(0.4,0.4,0.4) -- Corrente do elevador
    love.graphics.rectangle("fill", 400 - 95/2, 300 - 600/2, 95, 600)
love.graphics.setColor(66/255, 66/255, 66/255)  --Cor atrás do elevador (cinza)
    love.graphics.rectangle("fill", 400 - 3 , elevator_y - 600, 4, 600)
end
function texto_andar()
love.graphics.setColor(61/255, 30/255, 7/255) -- Cor da placa (marrom)
    love.graphics.rectangle("fill", 496, 397, 55, 20)
love.graphics.setColor(1,1,1)
    love.graphics.setFont(font)
    love.graphics.print("Térreo", 500, 400)
end

function love.draw()
love.graphics.setBackgroundColor(0/255, 122/255, 102/255) -- Fundo
desenha_corrente()
Elevator:draw() -- Elevador
love.graphics.translate(0, camera_y)
Andar:draw()
desenha_janela(100, 575 - 175)
desenha_janela(625, 575 - 175)
desenha_chão()
desenha_abajur()
desenha_movel_abajur()
texto_andar()
desenha_botoes()
end