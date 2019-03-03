-- Store local instance of read function and storage variable
local mbRead = MB.R; local val;

-- Configure timer
LJ.IntervalConfig(0, 100)
local checkInterval = LJ.CheckInterval

-- Control Loop
while true do
  if checkInterval(0) then
    -- Read FIO0
    val = mbRead(2000, 0)
    print(val)
  end
end
