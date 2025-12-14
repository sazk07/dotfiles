local ok, render_markdown = pcall(require, "render-markdown")
if not ok then
  render_markdown = nil
end
if render_markdown then
  render_markdown.setup({
    completions = {
      lsp = {
        enabled = true
      }
    },
    file_types = {
      "markdown", "vimwiki"
    },
    enabled = false
  })
end
