local luasimplex = require("luasimplex")
local rsm = require("luasimplex.rsm")

local M =
{
  -- number of variables
  nvars = 4,
  -- number of constraints
  nrows = 2,
  indexes = {1, 2, 3, 1, 2, 4},
  elements = {1, 2, 1, 2, 1, 1},
  row_starts = {1, 4, 7},
  c = {-1, -1, 0, 0},
  xl = {0, 0, 0, 0},
  xu = {math.huge, math.huge, math.huge, math.huge},
  b = {3, 3},
}

local I = luasimplex.new_instance(M.nrows, M.nvars)
rsm.initialise(M, I, {})

objective, x = rsm.solve(M, I, {})

io.stderr:write(("Objective: %g\n"):format(objective))
io.stderr:write("  x:")
for i = 1, M.nvars do io.stderr:write((" %g"):format(x[i])) end
io.stderr:write("\n")


-- EOF -------------------------------------------------------------------------

