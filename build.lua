#!/usr/bin/env texlua

module = "hustvisual"
typesetexe = "xelatex"
unpackfiles  = {module .. ".ins"}
typesetfiles = {module .. ".dtx"}
packtdszip = true

-- \file{xxx.xxx}{\from{xxx.dtx}{xxx}} (CORRECT in hustvisual.ins)
-- \file{xxx.xxx}{\from{visuals/xxx.dtx}{xxx}} (INCORRECT)
sourcefiles = {"*.ins", "*.dtx", "visuals/*.dtx"}
installfiles = {"*.ins", "*.dtx", "*.sty", "*.def"}
textfiles = {"LICENSE", "*.md"}
tdslocations = {
	"source/latex/" .. module .. "/*.ins",
	"source/latex/" .. module .. "/*.dtx",
}

function update_tag(file, content, tagname, tagdate)
	tagname = tagname:gsub("^v(%d.*)$", "%1")
	if not file:match("%.dtx$") then
		return content
	end
	local replaced_sign = "%^%^A %[L3BUILD_REPLACED_MARK%]"
	content = content:gsub("([^%c]-)%[DEV%]([^%c]-" .. replaced_sign .. ")", "%1" .. tagname .. "%2")
	content = content:gsub("([^%c]-)%[LATEST%]([^%c]-" .. replaced_sign .. ")", "%1" .. tagdate .. "%2")
	content = content:gsub(replaced_sign, "")
	return content
end
