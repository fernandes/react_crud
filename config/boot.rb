ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
env = ENV['RAILS_ENV'] || "development"

coverage = env == 'test' && ENV['COVERAGE'] == 'true' ? true : false

if coverage
  ENV['COVERAGE'] = 'true'
  require 'simplecov'
  SimpleCov.start :rails do
    add_filter "/bin/"
  end
end

unless env == 'test' || ENV['TRAVIS'] == 'true'
  require 'bootsnap'
  Bootsnap.setup(
    cache_dir:            'tmp/cache',          # Path to your cache
    development_mode:     env == 'development', # Current working environment, e.g. RACK_ENV, RAILS_ENV, etc
    load_path_cache:      true,                 # Optimize the LOAD_PATH with a cache
    autoload_paths_cache: true,                 # Optimize ActiveSupport autoloads with cache
    disable_trace:        false,                # (Alpha) Set `RubyVM::InstructionSequence.compile_option = { trace_instruction: false }`
    compile_cache_iseq:   !coverage,   # Compile Ruby code into ISeq cache, breaks coverage reporting.
    compile_cache_yaml:   true                  # Compile YAML into a cache
  )
end
