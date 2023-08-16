local ok, cmake_tools = pcall(require, "cmake-tools")
if not ok then
	cmake_tools = nil
end
if cmake_tools then
	cmake_tools.setup()
end
