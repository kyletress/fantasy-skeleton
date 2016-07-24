class ScheduleDraftJob < ApplicationJob
  queue_as :default

  def perform(draft)
    draft.in_progress!
  end
end
