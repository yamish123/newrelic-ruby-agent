# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/newrelic-ruby-agent/blob/main/LICENSE for complete details.

module NewRelic
  module Agent
    module Instrumentation
      module MonitoredFiber
        def add_fiber_tracing(*args, &block)
          return block if skip_tracing?
          NewRelic::Agent::Tracer.fiber_block_with_current_transaction(*args, &block)
        end

        def skip_tracing?
          !NewRelic::Agent.config[:'instrumentation.fiber.tracing']
        end
      end
    end
  end
end
