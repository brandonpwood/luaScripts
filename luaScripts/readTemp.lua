-- Init
print("Read and display the device temperature at 0.5 Hz.")
local tempK = 0
local tempF = 0

--Ensure analog is on
MB.W(48005, 0, 1)

--Configure interval
LJ.IntervalConfig(0, 500)
local checkInterval=LJ.CheckInterval

-- Helper function
function ConvertToF(degK)
  local degF = 0
  degF = (degK - 273.15) * 1.8000 + 32.00
  return degF
end

-- Control Loop
while true do
  if checkInterval(0) then     --interval finished
    tempK = MB.R(60052, 3)       --read address 60052 TEMPERATURE_DEVICE_K, type is 3 (FLOAT32)
    tempF = ConvertToF(tempK)
    print(tempF, "°F")
  end
end
