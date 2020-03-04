class ErrorsSerializer

  def initialize(object, status)
    @status = status
    @errors = object.errors.full_messages
  end
end
