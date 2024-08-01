local patterns = {
  [[Cargo\.toml]],
  [[LICENSE]],
  [[README\.md]],
  [[package\.json]],
}

vim.cmd.syntax("match NetrwSpecialFile /" .. table.concat(patterns, [[\|]]) .. "/")
