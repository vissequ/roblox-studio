--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local T_Strings = {
	"101001",
	"0010001",
	"111001",
	"0010011",
	"100100011",
	"0110011",
}

local T_TextLabels = {
	TL1 = script.Parent.TextLabel,
	TL2 = script.Parent.TextLabel2,
	TL3 = script.Parent.TextLabel3,
	TL4 = script.Parent.TextLabel4,
	TL5 = script.Parent.TextLabel5,
	TL6 = script.Parent.TextLabel6,
}

local function ClearTextLabels()
	for i,v in pairs(T_TextLabels) do
		v.Text = ""
	end
end

ClearTextLabels()

while true do
	local T_Strings_Index = 1

	for i,v in pairs(T_TextLabels) do
		--print(T_Strings_Index)
		local toPrint = T_Strings[T_Strings_Index]
		for i = 1, #toPrint do
			v.Text = v.Text..string.sub(toPrint, i, i)
			wait()
		end
		if T_Strings_Index < #T_Strings then
			T_Strings_Index = T_Strings_Index + 1
		else
			T_Strings_Index = 1
		end
	end
	
	wait()
	
	ClearTextLabels()
end
