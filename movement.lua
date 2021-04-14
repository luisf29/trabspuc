[[Movement = {}

function Movement:load()
  camera_y = 0
  acel = 150
  vel_y = 0
  max_vel_y = 500
  curr_y = 287.5
  larg = 47.5
  larg2 = -47.5
end
function Movement:update(dt)
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
      vel_y = vel_y + acel * dt
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
