LJ.ConfigureInterval(0, .1);

while true do 
  if LJ.CheckInterval(0) then
    print(LJ.Tick())
  end
end
