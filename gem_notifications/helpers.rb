# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/newrelic-ruby-agent/blob/main/LICENSE for complete details.

require 'json'

def delete_gemfile(filename)
  File.delete("#{filename}")
end

def create_gemfile(filename)
  File.new("#{filename}", "w")
end

def update_gemfile(updated_gems, filename)
  delete_gemfile(filename)
  newfile = create_gemfile(filename)
  write_gemfile(updated_gems, newfile)
end

def write_gemfile(updated_gems, newfile)
  newfile.puts(JSON.pretty_generate(updated_gems))
  newfile.close
end
