require 'active_model_serializers'

module Survey
  class Engine < ::Rails::Engine
    isolate_namespace Survey
  end
end
