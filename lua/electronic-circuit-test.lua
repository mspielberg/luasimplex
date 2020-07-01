local luasimplex = require("luasimplex")
local rsm = require("luasimplex.rsm")

local M =
{
  -- number of variables
  nvars = 2,
  -- number of constraints
  nrows = 2,
  indexes = {1, 1, 2},
  elements = {1, -3, 2},
  row_starts = {1, 2, 4},
  c = {10-1-3, -1+2},
  xl = {0, 0},
  xu = {math.huge, math.huge},
  b = {15, 0},
}

local I = luasimplex.new_instance(M.nrows, M.nvars)
rsm.initialise(M, I, {})

objective, x = rsm.solve(M, I, {})

io.stderr:write(("Objective: %g\n"):format(objective))
io.stderr:write("  x:")
for i = 1, M.nvars do io.stderr:write((" %g"):format(x[i])) end
io.stderr:write("\n")
