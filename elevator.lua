Elevator = {}

function Elevator:load()
    elevator_x = 400
    elevator_y = 514.5
    elevator_width = 95
    elevator_height = 120
    acel = 100
    vel_y = 0
    max_vel_y = 500
    max_y = 229
    max_y2 = 515
    camera_y = 0
    larg = 47.5
    larg2 = -47.5

end

function Elevator:update(dt)
    local kb = love.keyboard
if kb.isDown("w", "up") and larg > 0 and larg2 < 47.5 then
  if camera_y <= 2250 then
    if elevator_y <= max_y then
      camera_y = camera_y + vel_y *dt
    else
    elevator_y = elevator_y - vel_y * dt
    end
    if vel_y <= max_vel_y then
      vel_y = vel_y + acel * dt
    end
  end
elseif kb.isDown("s", "down") and larg > 0 and larg2 < 47.5 then
  if camera_y >= 0 then
      camera_y = camera_y - vel_y *dt
    elseif elevator_y <= max_y2 then
      elevator_y = elevator_y + vel_y * dt
    end
    if vel_y <= max_vel_y then
      vel_y =  vel_y - acel * dt
    end
  end
  if abrir == false and larg < 47.5 and larg2 > -47.5 then
    larg2 = larg2 - 0.5
    larg = larg + 0.5
  elseif abrir == true and larg > 0 and larg2 < 0  then
    larg2 = larg2 + 0.5
    larg = larg - 0.5
  end
end
  function Elevator:draw()
  love.graphics.setColor(0,0,0) -- Cor do elevador
    love.graphics.rectangle("fill",   elevator_x - elevator_width/2 ,  elevator_y - elevator_height/2, elevator_width, elevator_height) -- Elevador
  love.graphics.setColor(55/255, 82/255, 78/255) -- Cor da barrinha
    love.graphics.rectangle("fill",   elevator_x - 75/2 ,  elevator_y - 5/2 + 40 , 75, 5) -- barrinha
  love.graphics.setColor(5/255, 240/255, 240/255) -- Cor da Janela
    love.graphics.rectangle("fill",   elevator_x - 75/2 ,  elevator_y - 75/2 - 10 , 75 , 75) -- Porta
  love.graphics.setColor(1,1,1) -- Cor do reflexo na janela
    love.graphics.line(elevator_x -20, elevator_y -37 , elevator_x -30 , elevator_y - 23) -- reflexo janela
    love.graphics.line(elevator_x -13, elevator_y -36 , elevator_x -23 , elevator_y - 22) -- reflexo janela 
  love.graphics.setColor(0.31,0.31,0.31)
    love.graphics.rectangle("fill",   elevator_x  + 47,  elevator_y - 60 , larg2 , 120) -- Porta
    love.graphics.rectangle("fill",   elevator_x - 48 ,  elevator_y - 60 , larg  , 120) -- Porta

end
