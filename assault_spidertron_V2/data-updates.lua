
if data.raw.technology['spidertron'] then 
	table.insert (data.raw.technology['spidertron'].effects,{type = "unlock-recipe", recipe = "assault_spidertron"})
	data.raw.recipe["assault_spidertron"].enabled = false
	end

