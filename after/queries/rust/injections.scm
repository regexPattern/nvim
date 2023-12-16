;; extends

(call_expression
  function: (scoped_identifier
			  path: (identifier) @_function_path
			  (#eq? @_function_path "sqlx"))
  arguments: (arguments [
						 (macro_invocation
						   (token_tree (raw_string_literal) @injection.content))
						 (raw_string_literal) @injection.content
						 ])
  (#offset! @injection.content 0 3 0 -3)
  (#set! injection.language "sql"))
