Andar = {}

function Andar:load()
  curr_y = 287.5
end
function Andar:draw()
  for i = 1, 10, 1 do

--Chão
  love.graphics.setColor(55/255, 82/255, 78/255)
    love.graphics.rectangle("fill", 0, curr_y - 250*(i -1) , 352, 25)
    love.graphics.rectangle("fill", 447 , curr_y - 250*(i -1), 352, 25)
--Janela
    desenha_janela(100, curr_y - 187 - 250*(i -1))
    desenha_janela(625, curr_y - 187 - 250*(i -1))
-- Txt Geral
love.graphics.setColor(61/255, 30/255, 7/255) -- Cor da placa (marrom)
    love.graphics.rectangle("fill", 496, curr_y - 190.5 - 250*(i -1), 65, 20)
love.graphics.setColor(1,1,1) -- Cor do texto (marrom)
    love.graphics.print(tostring(i).."º Andar", 500, curr_y - 187.5 - 250*(i -1))
--Botões
love.graphics.setColor(138/255, 103/255, 224/255) -- Cor do botão (rosa)
    love.graphics.polygon("fill" ,315 , curr_y - 87.5 - 250*(i -1) , 320,   curr_y - 107.5 - 250*(i -1), 325,  curr_y - 87.5 - 250*(i -1))
    love.graphics.polygon("fill" ,315 , curr_y - 82.5 - 250*(i -1) , 320,   curr_y - 62.5 - 250*(i -1), 325,  curr_y - 82.5 - 250*(i -1))
end
end