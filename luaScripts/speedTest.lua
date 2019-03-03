-- Initalize
print("This is a test")

-- Configure timer
LJ.IntervalConfig(0, 1000)
local tick = LJ.Tick;
local t0 = tick();
local n = 1;
-- Control Loop
while true do
  if LJ.CheckInterval(0) then
    t1 = tick();
    print((t1-t0)/n)
    print('----------')
    n = n +1;
  end
end

LUA_RUN = 0
