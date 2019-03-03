-- SETTINGS. 1 to collect data, 0 to mute.
local AIO = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1} --AIO 0-13
local DIO = {1, 1, 1, 1, 1, 1, 1} -- Dio 0 is reserved for a button to break the control loop. This array is DIO 1-7
local ms = 500 -- Miliseconds between readings

-- INIT
local mbWrite = MB.W; local mbRead = MB.R
LJ.IntervalConfig(0, ms)
checkInterval = LJ.IntervalCheck

-- Storage Variables for runtime
local digital = {}
local dTimes = {}
local analog = {}
local aTimes = {}

-- CHECK HARDWARE
local hardware = mbRead(60010, 1)
local passed = 1;
if(bit.band(hardware, 8) ~= 8) then
  print("uSD card not Detected")
  passed = 0
end

if (passed == 0) then
  print("This Lua script requires an RTC module and a microSD card, but one or both are not detected. These features are only preinstalled on the T7-Pro. Script Stopping")
  mbWrite(6000, 1, 0)
end

-- OPEN FILE
local filename = "test.csv"
local file = io.open(filename, 'w')

if file then
  print("File successfully opened")
else
  print("Failed to open file. Quitting script.")
  mbWrite(6000, 1, 0)
end

-- Control Loop
while true do
  if checkInterval(0) then
    if mbRead(2000, 0) == 0 then -- Pull FIO0 to ground to stop loop
      break
    elseif mbRead(2002, 0) == 1 then -- Pull FIO1 to ground to silence loop
    end
  end
end

file:close
print("Done acquiring data. Now read and display file contents. \n")
file = io.open(Filename, "r")
local line = file:read("*all")
file:close()
print(line)

print("Finished Script")
MB.W(6000, 1, 0);
