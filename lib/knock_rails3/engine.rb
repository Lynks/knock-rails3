module KnockRails3
  class Engine < ::Rails::Engine
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]
    isolate_namespace KnockRails3
  end
end
