class Configuration

  FIELDS_STORE_IN_GLOBAL_VARIABLES = [
    :company_legal_name,
    :company_display_name,
    :help_desk_guide,
    :ios_payload_identifier,
    :ios_payload_display_name,
    :ios_payload_description,
  ]

  attr_accessor *FIELDS_STORE_IN_GLOBAL_VARIABLES

  def initialize
    GlobalVariable.configuration_updated_at ||= Time.now
    Configuration.cache! if Configuration.cache_need_to_be_rebuilt?
    FIELDS_STORE_IN_GLOBAL_VARIABLES.each do |field|
      instance_variable_set "@#{field}", Rails.cache.read(field)
    end
  end

  def save
    FIELDS_STORE_IN_GLOBAL_VARIABLES.each do |field|
      current_value = send(field)
      unless current_value == Rails.cache.read(field)
        GlobalVariable.send("#{field}=", current_value) ||
          Rails.cache.write(field, current_value)
      end
    end
    GlobalVariable.configuration_updated_at = time = Time.now
    Configuration.update_configuration_cached_timestamp(time)
    self
  end

  def update_attributes(params)
    params.slice(*FIELDS_STORE_IN_GLOBAL_VARIABLES).each do |key, value|
      send("#{key}=", value) unless send(key) == value
    end
    save
  end

  private

    def self.update_configuration_cached_timestamp(time = nil)
      time ||= GlobalVariable.configuration_updated_at
      Rails.cache.write(:configuration_cached_timestamp, time)
    end

    def self.cache!
      update_configuration_cached_timestamp
      FIELDS_STORE_IN_GLOBAL_VARIABLES.each do |field|
        Rails.cache.write(field, GlobalVariable.send(field))
      end
      Rails.cache.write(:configuration_cache_initialized, true)
    end

    def self.cache_need_to_be_rebuilt?
      cached_version_is_dated?
    end

    def self.configuration_has_not_been_cached?
      !Rails.cache.read(:configuration_cache_initialized)
    end

    def self.cached_version_is_dated?
      return true if configuration_has_not_been_cached?
      configuration_updated_at = GlobalVariable.configuration_updated_at
      cached_version_timestamp = Rails.cache.read(:configuration_cached_timestamp)
      configuration_updated_at > cached_version_timestamp
    end
end
