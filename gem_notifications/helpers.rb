# frozen_string_literal: true

def delete_gemfile
  File.delete('gem_notifications/watched_gems.json')
end

def create_gemfile
  File.new('gem_notifications/watched_gems.json', 'w')
end

def update_gemfile(updated_gems)
  delete_gemfile
  gemfile = create_gemfile
  write_gemfile(updated_gems, gemfile)
end

def write_gemfile(updated_gems, gemfile)
  gemfile.puts(JSON.pretty_generate(updated_gems))
  gemfile.close
end
