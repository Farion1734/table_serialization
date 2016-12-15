function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function serialize(a)
	if (type(a) == "number") then 
		return tostring(a)
	elseif (type(a) == "nil") then 
		return "nil"
	elseif (type(a) == "boolean") then 
		return tostring(a)
	elseif (type(a) == "table") then
		local vals = { "{" }
		current = 1
		total = tablelength(a)
		for k,v in pairs(a) do
			vals[#vals + 1] = serialize(k)
			vals[#vals + 1] = ":"
			vals[#vals + 1] = serialize(v)
			if (current ~= total) then
				vals[#vals + 1] = ","
			end
			current = current + 1
		end
		vals[#vals + 1] = "}"
		return table.concat(vals, " ")
	elseif (type(a) == "string") then
		return a
	end
end

t = {"a", "b", [123]="foo", "c", name="bar", "d", "e"}
io.write(serialize(t))