# frozen_string_literal: true

module Que
  module Scheduler
    module Db
      SCHEDULER_COUNT_SQL =
        "SELECT COUNT(*) FROM que_jobs WHERE job_class = '#{Que::Scheduler::SchedulerJob.name}'"
      NOW_SQL = 'SELECT now()'

      class << self
        def count_schedulers
          Que.execute(SCHEDULER_COUNT_SQL).first.values.first.to_i
        end

        def now
          Que.execute(NOW_SQL).first.values.first
        end
      end
    end
  end
end