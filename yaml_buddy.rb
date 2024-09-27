# frozen_string_literal: true

require 'yaml'

# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  # Converts a String with yaml data into internal data structure @data
  # arguments: yaml - a String in yaml format
  # returns: nothing
  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
  end

  # Converts @data into yaml string
  # arguments: none
  # returns: String in yaml format
  def to_yaml
    YAML.dump(@data)
  end
end
