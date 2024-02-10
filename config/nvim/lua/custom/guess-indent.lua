local ok, guess_indent = pcall(require, "guess-indent")
if not ok then
  guess_indent = nil
end
if guess_indent then
  guess_indent.setup()
end
