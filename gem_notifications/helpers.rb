# frozen_string_literal: true
require 'json'

def delete_gemfile(filename)
  File.delete("#{filename}") if File.exist?("#{filename}")
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
