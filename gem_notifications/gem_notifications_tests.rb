require 'minitest/autorun'
require_relative 'bot'
require_relative 'update_script'
require_relative 'helpers'

class UpdatedGems < Minitest::Test
  def test_watched_gems_not_empty?
    assert File.zero?("watched_gems.json") == false
  end

  # valid Gem gets passed to API

  # bot is called when mismatched gem versions

end
