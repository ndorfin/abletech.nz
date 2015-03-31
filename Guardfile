guard :rspec, cmd: 'bundle exec rspec', all_on_start: true, all_after_pass: false do
  watch(%r{^source/.*$}){'spec'}

  watch(%r{^spec/.+_spec\.rb$})
  watch('spec/spec_helper.rb')
end

