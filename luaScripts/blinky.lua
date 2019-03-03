print("This is a test")
LJ.IntervalConfig(1, 1000)
-- Control Loop
while true do
  if LJ.CheckInterval(1) then
    LJ.ledtog()
    print("run")
  end
end

LUA_RUN = 0
