guard :minitest do
  watch(%r{^spec/lib/gracenote/(.*)_spec\.rb})
  watch(%r{^lib/(.+)\.rb})         { |m| "spec/*/#{m[1]}_spec.rb" }
  watch(%r{^spec/spec_helper\.rb}) { 'spec' }
end
