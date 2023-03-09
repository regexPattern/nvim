local cmp_compare = require("cmp.config.compare")
local cmp_default_weights = require("cmp.types.lsp").CompletionItemKind

-- snippetSortOrder = bottom
-- kindFilter = completionItemKind

local custom_weights = vim.tbl_add_reverse_lookup({
	Method = 1,
	Function = 2,
	Constructor = 3,
	Field = 4,
	Variable = 5,
	Class = 6,
	Struct = 7,
	Interface = 8,
	Module = 9,
	Property = 10,
	Event = 11,
	Operator = 12,
	Unit = 13,
	Value = 14,
	Constant = 15,
	Enum = 16,
	EnumMember = 17,
	Keyword = 18,
	Text = 19,
	Color = 20,
	File = 21,
	Reference = 22,
	Customcolor = 23,
	Folder = 24,
	TypeParameter = 25,
	User = 26,
	Issue = 27,
	Snippet = 28,
})

vim.pretty_print(custom_weights)

local compare_kind = function(entry1, entry2)
  local kind1 = custom_weights[cmp_default_weights[entry1:get_kind()]] or 100
  local kind2 = custom_weights[cmp_default_weights[entry2:get_kind()]] or 100
  if kind1 ~= kind2 then
		local diff = kind1 - kind2
		if diff < 0 then
			return true
		elseif diff > 0 then
			return false
		end
  end
end

local compare_label = function(entry1, entry2)
	if entry1.completion_item.label and entry2.completion_item.label then
		local diff = vim.stricmp(entry1.completion_item.label, entry2.completion_item.label)
		if diff < 0 then
			return true
		elseif diff > 0 then
			return false
		end
	end
end

return {
	priority_weight = 2,
	comparators = {
		-- cmp_compare.exact,
		-- cmp_compare.score,
		-- sorting.kind,
		cmp_compare.offset,
		cmp_compare.score,
    cmp_compare.sort_text,
		-- cmp_compare.length,
		cmp_compare.recently_used,
		cmp_compare.locality,
		compare_label,
		compare_kind,
	},
}
