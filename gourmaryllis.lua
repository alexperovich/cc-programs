
function dropItem(name, count)
  print(string.format("Dropping %d %s", count, name))
  while true do
    for i=1, 16 do
      local item = turtle.getItemDetail(i)
      if item then
        if item.name == name then
          local toDrop = math.min(count, item.count)
          assert(turtle.select(i))
          assert(turtle.drop(toDrop))
          count = count - toDrop
          if count == 0 then
            return true
          end
        end
      end
    end
    os.sleep(1)
  end
end

redstoneSide = "back"
pauseValue = 10

function main()
  while true do
    if redstone.getAnalogInput(redstoneSide) >= pauseValue then
      print("Disabled by Redstone Signal")
      os.sleep(2)
    else
      dropItem("minecraft:baked_potato", 1)
      os.sleep(2.5)
      dropItem("minecraft:bread", 1)
      os.sleep(2.5)
    end
  end
end


main(...)

