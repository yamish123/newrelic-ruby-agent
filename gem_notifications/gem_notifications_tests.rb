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
  # delete_gemfile ... is gemfile gone
  # create_gemfile .. assert gemfile there
  # update_gemfile .. gemfile not empty

  # malformed content?

  # rescue for bad files

  # write_gemfile .. updated_gems == JSON.parse the new file

  # what happens with a fake gem that I assigned to a version. What
  # happens to that version as we call methods?
end
