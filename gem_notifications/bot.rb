# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/newrelic-ruby-agent/blob/main/LICENSE for complete details.

def send_bot(gem, current_version, latest_version)
  `curl -X POST -H 'Content-type: application/json' --data '{"text":"Hey Ruby team!
  #{gem} #{current_version} is now #{gem} #{latest_version}."}' #{ENV['SLACK_GEM_NOTIFICATIONS_WEBHOOK']}`
end
