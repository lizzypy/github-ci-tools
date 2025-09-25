# Represents a GitHub Event that can be dispatched to a specific repository.
# These events can trigger additional workflows in a pipeline.
class GitHubEvent
  def initialize(event_type:, payload:)
    @event_type = event_type
    @payload = payload
  end

  def dispatch

  end
end