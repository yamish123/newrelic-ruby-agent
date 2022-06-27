# frozen_string_literal: true

def create_gemfile(updated_gems)
  File.delete('watched_gems.json')
  gemfile = File.new('watched_gems.json', 'w')
  gemfile.puts(JSON.pretty_generate(updated_gems))
  gemfile.close
end
