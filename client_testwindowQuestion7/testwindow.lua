-- private variables
local testwindow
local testwindowButton
local moveEvent

-- public functions
function init()
  testwindow = g_ui.displayUI('testwindow')
  testwindow:hide()
 
  testwindowButton = modules.client_topmenu.addLeftButton('testwindowButton', 
    tr('Test window'), '/images/topbuttons/testwindow', toggle)
	
  
end

function toggle()
  if testwindow:isVisible() then
    hide()
  else
    show()
  end
end

function show()
  testwindow:show()
  testwindow:raise()
  testwindow:focus()
  run()
end

function run()
  local bbutn = testwindow:recursiveGetChildById('jumpButton')
  if(bbutn:getMarginRight() < 280) then
		bbutn:setMarginRight(bbutn:getMarginRight() + 5)
	else
		bbutn:setMarginRight(0)
    end
  moveEvent = scheduleEvent(function() run() end, 150)
  return
end

function hide()
  testwindow:hide()
end

function terminate()
  testwindow:destroy()
  testwindowButton:destroy()
  testwindow = nil
end

function jumpButton()
  local bbutn = testwindow:recursiveGetChildById('jumpButton')
  local randomNumber 
  if(bbutn:getMarginBottom() > 150) then
  randomNumber = math.random(10, 150)
  bbutn:setMarginBottom(randomNumber)
  else
  randomNumber = math.random(150, 270)
  bbutn:setMarginBottom(randomNumber)
  end
end