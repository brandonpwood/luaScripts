-- INIT
local mbWrite = MB.W; local mbRead = MB.R;
local checkHardware = 0;
local verbose = 1;
local filename = "/test.csv";
local ms = 1; -- Set to 1kHz
LJ.IntervalConfig(0, ms);
local checkInterval = LJ.CheckInterval;

-- CHECK HARDWARE
if checkHardware == 1 then
  local hardware = mbRead(60010, 1)
  local passed = 1;
  if(bit.band(hardware, 8) ~= 8) then
    print("uSD card not Detected.")
    passed = 0
  end
  if(bit.band(hardware, 4) ~= 4) then
    print("RTC module not detected.")
    passed = 0
  end
  if passed == 0 then
    print("This Lua script requires an RTC module and a microSD card, but one or both are not detected. These features are only preinstalled on the T7-Pro. Script Stopping.")
    mbWrite(6000, 1, 0)
  end
end

-- OPEN FILE
local file = io.open(filename, 'w')

if file then
  print("File Opened Successfully. Ready to write.")
else
  print("Failed to Open File. Closing Script.")
  mbWrite(6000, 1, 0)
end

-- CONTROL LOOP
while true do
  if checkInterval(0) then
    if mbRead(2000, 0) == 0 then -- If FIO 0 is pulled to ground, stop loop
      break
    else
      -- TODO: WRITE RTC STAMP TO FILE
      for j = 0,11 do
        local digit = mbRead(0 + 2*j, 3)
        local label = "AIO" .. string.format("%g", j)
        print(digit)
        file:write(label, ',' , tostring(digit), "\n")
      end
      -- TODO: WRITE RTC STAMP TO FILE
    end
  end
end
file:close()
print("Data Acquisition Terminated.")

-- LOG DATA
if verbose then
  print("Displaying Contents of Data.")
  file = io.open(filename, "r")
  if file then
    local line = file:read("*all")
    print(line)
    print("End of File")
  else
    print("File unsuccesfully opened")
  end
  file:close()
end
mbWrite(6000, 1, 0);
