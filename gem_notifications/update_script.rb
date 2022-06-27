# frozen_string_literal: true

require_relative 'helpers'
require_relative 'bot'
require 'httparty'
require 'json'

watched_gems = JSON.parse(File.read('watched_gems.json'))
updated_gems = JSON.parse(File.read('watched_gems.json'))

watched_gems.each do |gem, version|
  gem_info = HTTParty.get("https://rubygems.org/api/v1/versions/#{gem}/latest.json")
  latest_version = gem_info['version']
  if version != latest_version
    updated_gems[gem] = latest_version
    send_bot(gem, version, latest_version)
  end
  create_gemfile(updated_gems) if watched_gems != updated_gems
end
