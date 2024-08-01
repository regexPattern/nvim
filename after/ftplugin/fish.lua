---@diagnostic disable-next-line: unused-local
function _G.fish_complete(findstart, base)
  if findstart == 1 then
    return vim.fn.col "."
  else
    -- :vert h complete-items
    local result = vim.system({ "fish", "-c", "complete -C 'cat ./'" }, { text = true }):wait()
    return vim.split(result.stdout, "\n")
  end
end

vim.bo.omnifunc = "v:lua._G.fish_complete"
