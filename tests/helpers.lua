-- tests/helpers.lua · load addon files the way WoW does: (addonName, ns) varargs
local H = {}

H.CORE = { "core/rng.lua", "core/text.lua", "core/sim.lua", "core/playlist.lua", "core/narrator.lua", "core/config.lua" }

-- Load the listed files (default: all pure core modules) into a fresh ns.
function H.load(files, ns)
	ns = ns or {}
	for _, path in ipairs(files or H.CORE) do
		assert(loadfile(path))("OrcTok", ns)
	end
	return ns
end

return H
