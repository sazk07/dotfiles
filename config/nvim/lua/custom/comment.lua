local ok, comment = pcall(require, "Comment")
if not ok then
	comment = nil
end
if comment then
	comment.setup()
end
