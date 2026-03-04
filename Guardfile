clearing :on

guard :minitest, spring: false do
  watch(%r{^test/(.*)_test\.rb$})
  watch(%r{^test/test_helper\.rb$})       { "test" }

  # Rails
  watch(%r{^app/controllers/(.+)_controller\.rb$}) { |m|
    "test/controllers/#{m[1]}_controller_test.rb"
  }
  watch(%r{^app/models/(.+)\.rb$})       { |m| "test/models/#{m[1]}_test.rb" }
end
