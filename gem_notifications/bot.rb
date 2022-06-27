# frozen_string_literal: true

def send_bot(gem, version, latest_version)
  `curl -X POST -H 'Content-type: application/json' --data '{"text":"Hey Ruby team!
  #{gem} #{version} is now #{gem} #{latest_version}."}' #{ENV['SLACK_GEM_NOTIFICATIONS_WEBHOOK']}`
end
