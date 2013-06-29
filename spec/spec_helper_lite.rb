ENV["RAILS_ENV"] ||= 'test'

def needs(path_fragment)
  local_path = path_fragment.match(/\A(lib|config)\Z/)
  local_path ||= %{app/#{path_fragment}}

  full_path = File.expand_path(File.join(Dir.pwd, local_path.to_s))
  unless $LOAD_PATH.include?(full_path)
    $LOAD_PATH.unshift full_path
  end
end

RSpec.configure do |config|
  config.order = "random"
end
