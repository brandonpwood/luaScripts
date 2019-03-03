-- INIT
local PORT = 1;
local mbWrite = MB.W; local mbRead = MB.R;
local checkHardware = 0;
local verbose = 0;
local filename = "/tests.csv";
local ms = 1; -- Set to 1kHz
LJ.IntervalConfig(0, ms);
local checkInterval = LJ.CheckInterval;
local data = 0;
local reg = 2000 + PORT;

-- OPEN FILE
local file = io.open(filename, 'a') -- Opening in append mode for max speed

if file then
  print("File Opened Successfully. Ready to write.")
else
  print("Failed to Open File. Closing Script.")
  mbWrite(6000, 1, 0)
end

io.output(file);
local write = io.write;
write(file, "DIO"..tostring(PORT))



-- CONTROL LOOP
while true do
  if checkInterval(0) then
    if mbRead(2000, 0) == 0 then -- If FIO 0 is pulled to ground, stop loop
      break
    else
      -- Write data to file
      write(file, tostring(mbRead(reg, 0)));
    end
  end
end

file:close()
print("Data Acquisition Terminated.")
