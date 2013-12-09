require File.join(File.dirname(__FILE__), 'abstract_session_proxy')

module Sunspot
  module SessionProxy
    #
    #
    class CustomShardingSessionProxy < AbstractSessionProxy
      not_supported :batch, :config, :remove_by_id, :remove_by_id!

      #
      # +sessions+ is a hash of all shard sessions.
      #
      def initialize(shards)
        @sessions = shards
      end

      #
      # Return the appropriate shard session for the object.
      #
      def session_for(object)
        @sessions[object]
      end

      #
      # Return all shard sessions.
      #
      def all_sessions
        @sessions
      end

    end
  end
end
