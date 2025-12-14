local ok, better_escape = pcall(require, "better_escape")
if not ok then
	better_escape = nil
end
if better_escape then
	better_escape.setup()
end
