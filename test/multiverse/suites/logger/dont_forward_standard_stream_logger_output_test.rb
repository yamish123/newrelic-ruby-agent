# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/newrelic-ruby-agent/blob/main/LICENSE for complete details.

class DontForwardStandardStreamLoggerOutputTest < Minitest::Test
  include MultiverseHelpers

  def setup
    reset_everything
  end

  def teardown
    reset_everything
  end

  def test_stdout_logger_is_marked_for_skipping
    stdout_logger = ::Logger.new($stdout)
    string_logger = ::Logger.new(StringIO.new)
    [stdout_logger, string_logger].map { |logger| logger.info(log_message) }
    assert_equal [true, false], [stdout_logger.skip_instrumenting?, string_logger.skip_instrumenting?]
  end

  def test_stderr_logger_is_marked_for_skipping
    stderr_logger = ::Logger.new($stderr)
    string_logger = ::Logger.new(StringIO.new)
    [stderr_logger, string_logger].map { |logger| logger.info(log_message) }
    assert_equal [true, false], [stderr_logger.skip_instrumenting?, string_logger.skip_instrumenting?]
  end

  def test_stdout_logger_is_not_skipped_when_solo
    stdout_logger = ::Logger.new($stdout)
    stdout_logger.info(log_message)
    assert !stdout_logger.skip_instrumenting?
  end

  def test_stderr_logger_is_not_skipped_when_solo
    stderr_logger = ::Logger.new($stderr)
    stderr_logger.info(log_message)
    assert !stderr_logger.skip_instrumenting?
  end

  def test_duped_standard_stream_handle
    duped_stream_logger = ::Logger.new(STDOUT.dup)
    string_logger = ::Logger.new(StringIO.new)
    [duped_stream_logger, string_logger].map { |logger| logger.info(log_message) }
    assert_equal [true, false], [duped_stream_logger.skip_instrumenting?, string_logger.skip_instrumenting?]
  end

  def test_double_stdout_loggers_both_get_marked_for_skipping
    stdout_logger1 = ::Logger.new($stdout)
    stdout_logger2 = ::Logger.new($stdout)
    [stdout_logger1, stdout_logger2].map { |logger| logger.info(log_message) }
    assert_equal [false, false], [stdout_logger1.skip_instrumenting?, stdout_logger2.skip_instrumenting?]
  end

  def log_message
    'Logging test'.freeze
  end

  def reset_everything
    NewRelic::Agent.instance.log_event_aggregator.reset!
    NewRelic::Agent.instance.log_event_aggregator.instance_variable_set(:@loggers, {})
  end
end
