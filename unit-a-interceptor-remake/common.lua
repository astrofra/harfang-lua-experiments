function Clamp(val, lower, upper)
    if lower > upper then lower, upper = upper, lower end
    return math.max(lower, math.min(upper, val))
end

function RangeAdjust(val, in_lower, in_upper, out_lower, out_upper)
    return (val - in_lower) / (in_upper - in_lower) * (out_upper - out_lower) + out_lower
end

function EaseInOutQuick(x)
	x = Clamp(x, 0.0, 1.0)
	return	(x * x * (3 - 2 * x))
end

function GenerateSquareFlicker(_frequency) -- In Hz
	local	frequency = _frequency or 60.0
	local	phase = (gs.time.now_ms() / 1000.0) * 2.0 * math.pi * frequency
	local	osc = math.sin(phase)
	if (osc < 0.0) then
		return true
	else
		return false
	end
end

-- From http://lua-users.org/wiki/CopyTable

function shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function string:split(sep)
    local sep, fields = sep or ":", {}
    local pattern = string.format("([^%s]+)", sep)
    self:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
end
