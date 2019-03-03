-- INIT
local mbWrite = MB.W; local mbRead = MB.R;
local checkHardware = 0;
local verbose = 0;
local filename = "/tests.csv";
local ms = 1; -- Set to 1kHz
LJ.IntervalConfig(0, ms);
local checkInterval = LJ.CheckInterval;

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
write(file, "AIN0, AIN1, AIN2, AIN3, AIN4, AIN5, AIN6, AIN7, AIN8, AIN9, AIN10, AIN11, DIO1, DIO2, DIO3, DIO4, DIO5, DIO6, DIO7")
local data = {};
for i = 0, 18 do
  data[i] = 0;
end

-- CONTROL LOOP
while true do
  if checkInterval(0) then
    if mbRead(2000, 0) == 0 then -- If FIO 0 is pulled to ground, stop loop
      break
    else
      -- Store data
      for i = 1, 7 do
        data[i+11] = mbRead(2000 + i, 0); -- Single bit
      end
      -- Write data to file
      write(file, data);
    end
  end
end

file:close()
print("Data Acquisition Terminated.")
