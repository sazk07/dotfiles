local ok, indent_blankline = pcall(require, "ibl")
if not ok then
  indent_blankline = nil
end
if indent_blankline then
  indent_blankline.setup()
end
