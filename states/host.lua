http = require "socket.http"

host = {}
function host:init()
    remip = http.request("https://api.ipify.org/?format=text") -- get external ipv4 address. ipv6 not supported by LuaSocket yet
    remip = split(remip, "\n")
    remip = remip[1]
    port = 45558 -- nap cards port
    love.graphics.setBackgroundColor(200,200,200)
    hostitem1 = Button:new(true, true, 200, 300, strings['host']['item1'], longbutton, longbutton_pressed, true, false, zombie)
    hostitem2 = Button:new(true, true, 200, 230, strings['host']['item2'], longbutton, longbutton_pressed, true, false, zombie)
end

function host:update()
   	text = ""
   	text2 = ""

		-- check for mouse events

   	if hostitem1:Click() then
      ishosting = true
   		Gamestate.switch(hosting)
		end
   	if hostitem2:Click() then
      Gamestate.switch(menu)
		end

end

function host:draw()
    love.graphics.setColor(40, 40, 40, 255)
    love.graphics.setFont(sysfont);
    love.graphics.print( strings['host']['yourip'] .. remip, 10, 20)
    love.graphics.print( strings['host']['portmsg'], 10, 40)
    love.graphics.setFont(zombie);
    love.graphics.setColor(255, 255, 255, 255)
		-- draw graphics
    love.graphics.draw(hostitem1.image, hostitem1.x, hostitem1.y)
    love.graphics.draw(hostitem2.image, hostitem2.x, hostitem2.y)
    love.graphics.setColor(230, 230, 230, 255)
    love.graphics.print(hostitem1.text, hostitem1.text_x, hostitem1.text_y)
    love.graphics.print(hostitem2.text, hostitem2.text_x, hostitem2.text_y)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(cursor, love.mouse.getX(), love.mouse.getY())
end