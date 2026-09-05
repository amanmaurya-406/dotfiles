-- Load Variant
function Load_variant(variant_file, variant_name)
	variant_file = variant_file:gsub(".lua", "")
	require("configs." .. variant_name .. "." .. variant_file)
end
