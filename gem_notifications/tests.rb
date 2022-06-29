require 'minitest/autorun'
require_relative 'bot'
require_relative 'update_script'
require_relative 'helpers'

class UpdatedGems < Minitest::Test
  # def teardown
  #   File.delete("testfile.json")
  #   # delete_gemfile('testfile.json')
  # end

  def test_watched_gems_not_empty
    assert File.zero?("watched_gems.json") == false
  end

  def test_delete_gemfile
    File.new('testfile.json', 'w')
    delete_gemfile('testfile.json')
    assert File.exist?('testfile.json') == false
  end

  def test_create_gemfile
    create_gemfile('testfile.json')
    assert File.exist?('testfile.json') == true
    File.delete("testfile.json")
  end

  def test_update_gemfile_not_empty
    create_gemfile('testfile.json')
    update_gemfile('some content', 'testfile.json')
    assert File.zero?("testfile.json.json") == false
    File.delete("testfile.json")
  end
  # valid Gem gets passed to API
  # bot is called when mismatched gem versions

  # malformed content?

  # rescue for bad files

  # write_gemfile .. updated_gems == JSON.parse the new file

  # what happens with a fake gem that I assigned to a version. What
  # happens to that version as we call methods?
end
