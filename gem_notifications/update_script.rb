# frozen_string_literal: true

require_relative 'helpers'
require_relative 'bot'
require 'httparty'
require 'json'

filename = 'gem_notifications/watched_gems.json'

if File.zero?("#{filename}") || File.exist?("#{filename}") == false
  raise 'watched_gems.json cannot be empty'
end

watched_gems = JSON.parse(File.read(filename))
updated_gems = JSON.parse(File.read(filename))

watched_gems.each do |gem, current_version|
  gem_info = HTTParty.get("https://rubygems.org/api/v1/versions/#{gem}/latest.json")
  latest_version = gem_info['version']
  if current_version != latest_version
    updated_gems[gem] = latest_version
    send_bot(gem, current_version, latest_version)
  end
  update_gemfile(updated_gems, filename) if watched_gems != updated_gems
end
