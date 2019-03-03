-- Initialize Read, write, voltage holder
local mbWrite = MB.W; local mbRead = MB.R; local V;

-- Enable analog reading
mbWrite(48005, 0, 1)

-- Configure timer
LJ.IntervalConfig(0, 100)
local checkInterval = LJ.CheckInterval

-- Control Loop
while true do
  if checkInterval(0) then
    -- Read AIN0 and print to screen
    V = mbRead(0, 3)
    print(V)
  end
end
