-- INIT
local mbWrite = MB.W; local mbRead = MB.R
LJ.IntervalConfig(0, 500)
local checkInterval = LJ.CheckInterval

-- CHECK HARDWARE
local hardware = MB.R(60010, 1)
local passed = 1
if(bit.band(hardware, 8) ~= 8) then
  print("uSD card not detected")
  passed = 0
end

if(passed == 0) then
  print("This Lua script requires an RTC module and a microSD card, but one or both are not detected. These features are only preinstalled on the T7-Pro. Script Stopping")
  MB.W(6000, 1, 0)--stop script
else
  print("Ready to read!")
end


-- OPEN FILE
local filename = "test.csv"
local file = io.open(filename, 'w')

if file then
  print('File successfully opened')
else
  print('Failed to open file. Quitting script')
  mbWrite(6000, 1, 0)
end

-- Control Loop
local i = 0;
while true do
  if checkInterval(0) then
    print(i)
    local converted = tostring(i)
    file:write(converted, "\n")
    i = i + 1;
  end
  if i > 10 then
    break
  end
end
file:close()

-- Print data on SD card
print("Done acquiring data. Now read and display file contents. \n")
file = io.open(filename, "r")
local line = file:read("*all")
file:close()
print(line)

print("Finished Script")
MB.W(6000, 1, 0)
