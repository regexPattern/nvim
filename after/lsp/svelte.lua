return {
  filetypes = { "svelte" },
  init_options = {
    configuration = {
      typescript = {
        inlayHints = {
          parameterNames = {
            enabled = "all",
            suppressWhenArgumentMatchesName = false
          },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true }
        }
      },
      javascript = {
        inlayHints = {
          parameterNames = {
            enabled = "all",
            suppressWhenArgumentMatchesName = false
          },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true }
        }
      }
    }
  },
  settings = {
    svelte = {
      plugin = {
        typescript = {
          diagnostics = { enable = true },
          hover = { enable = true }
        }
      }
    }
  }
}
