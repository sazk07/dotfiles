local ok, typescript_tools = pcall(require, "typescript-tools")
if not ok then
  typescript_tools = nil
end
if typescript_tools then
  typescript_tools.setup({
    expose_as_code_action = { "organize_imports" }
  })
end
