class Configuration

  FIELDS_STORE_IN_GLOBAL_VARIABLES = [:company_legal_name, :company_display_name, :help_desk_guide]

  FIELDS_STORE_IN_GLOBAL_VARIABLES.each { |field| attr_accessor field }

  def initialize
    FIELDS_STORE_IN_GLOBAL_VARIABLES.each { |field| instance_variable_set "@#{field}", GlobalVariable.send(field) }
  end

  def save
    FIELDS_STORE_IN_GLOBAL_VARIABLES.each do |field|
      GlobalVariable.send("#{field}=", send(field))
    end
    self
  end

  def update_attributes(params)
    params.each { |key, value| send("#{key}=", value) if key.to_sym.in? FIELDS_STORE_IN_GLOBAL_VARIABLES }
    save
  end
end
