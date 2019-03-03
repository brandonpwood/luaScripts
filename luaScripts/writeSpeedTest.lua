-- Initalize
print("This is a test")

-- Configure timer
LJ.IntervalConfig(0, 1000)
local tick = LJ.Tick;
local mbRead = MB.R;
local filename = "/test.csv";
local AIN0 = mbRead(2000, 0)
local file = io.open(filename, 'w')


-- Control Loop
while true do
  if LJ.CheckInterval(0) then
    t1 = tick();
    file:write('T', ',' , tostring(AIN0), "\n")
    file:write('T', ',' , tostring(AIN0), "\n")
    t2 = tick();
    print(t2-t1)
  end
end
file:close()

LUA_RUN = 0
