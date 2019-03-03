-- Initalize
print("This is a test")

-- Configure timer
LJ.IntervalConfig(0, 1000)
local tick = LJ.Tick;
local mbRead = MB.R;
-- Control Loop
while true do
  if LJ.CheckInterval(0) then
    t1 = tick();
    local AIN0 = mbRead(0, 3)
    t2 = tick();
    print(t2-t1)
  end
end

LUA_RUN = 0
