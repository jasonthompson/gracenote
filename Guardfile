notification :emacs

guard :minitest do
  # with Minitest::Spec
  watch(%r{^spec/unit/(.*)_spec\.rb})
  watch(%r{^lib/gracenote/(.+)\.rb})         { |m| "spec/unit/#{m[1]}_spec.rb" }
  watch(%r{^spec/spec_helper\.rb}) { 'spec' }
end
