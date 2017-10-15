module KnockKnock
  class Engine < ::Rails::Engine
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]
    isolate_namespace KnockKnock
  end
end
