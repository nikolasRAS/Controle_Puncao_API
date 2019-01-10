class RecordSearch
  attr_reader :protocol
  
  def initialize(params)
    params ||= {}
    @protocol = params[:protocol]
  end
  
  def scope
    Record.where('protocol = ?', @protocol)
  end
end