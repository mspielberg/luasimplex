local luasimplex = {}

local function array(n)
  local a = {}
  for i = 1, n do a[i] = 0 end
  return a
end

function luasimplex.new_model(nrows, nvars, nonzeroes)
  local M = {}

  M.nvars = nvars
  M.nrows = nrows
  M.nonzeroes = nonzeroes

  M.indexes = array(nonzeroes)
  M.row_starts = array(nrows+1)
  M.elements = array(nonzeroes)

  M.b = array(nrows)
  M.c = array(nvars)
  M.xl = array(nvars)
  M.xu = array(nvars)
  return M
end

function luasimplex.new_instance(nrows, nvars)
  local I = {}

  local total_vars = nvars + nrows

  I.status = array(total_vars)
  I.basics = array(nrows)
  I.basic_cycles = array(nvars)

  I.costs = array(nvars)
  I.x = array(total_vars)
  I.xu = array(total_vars)
  I.xl = array(total_vars)

  I.basic_costs = array(nrows)
  I.pi = array(nrows)
  I.reduced_costs = array(nvars)
  I.gradient = array(nrows)
  I.Binverse = array(nrows * nrows)
  return I
end

return luasimplex