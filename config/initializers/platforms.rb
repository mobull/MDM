Platform::IDENTIFIER_DISPLAY_NAME_MAP.each do |identifier, display_name|
  Platform.send(identifier)
end