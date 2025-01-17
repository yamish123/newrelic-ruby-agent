# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/newrelic-ruby-agent/blob/main/LICENSE for complete details.
# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: infinite_tracing.proto for package 'com.newrelic.trace.v1'
# Original file comments:
# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/newrelic-ruby-agent/blob/main/LICENSE for complete details.
#

module Com
  module Newrelic
    module Trace
      module V1
        module IngestService
          class Service
            include GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'com.newrelic.trace.v1.IngestService'

            # Accepts a stream of Span messages, and returns an irregular stream of
            # RecordStatus messages.
            rpc :RecordSpan, stream(Span), stream(RecordStatus)
            # Accepts a stream of SpanBatch messages, and returns an irregular
            # stream of RecordStatus messages. This endpoint can be used to improve
            # throughput when Span messages are small
            rpc :RecordSpanBatch, stream(SpanBatch), stream(RecordStatus)
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
