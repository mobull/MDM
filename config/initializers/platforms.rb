if Platform.table_exists?
  Platform::ALLOWED_IDENTIFIERS.each do |identifier|
    Platform.send(identifier)
  end
end
