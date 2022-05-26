# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/newrelic-ruby-agent/blob/main/LICENSE for complete details.

require_relative 'fiber/chain'
require_relative 'fiber/prepend'

DependencyDetection.defer do
  named :fiber

  executes do
    ::NewRelic::Agent.logger.info 'Installing Fiber Instrumentation'

    if use_prepend?
      prepend_instrument ::Fiber, ::NewRelic::Agent::Instrumentation::MonitoredFiber::Prepend
    else
      chain_instrument ::NewRelic::Agent::Instrumentation::MonitoredFiber::Chain
    end
  end
end
