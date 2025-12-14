local ok, flutter = pcall(require, "flutter-tools")
if not ok then
  flutter = nil
end
if flutter then
  flutter.setup()
end
