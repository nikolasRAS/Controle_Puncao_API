class ReportsController < ApplicationController

  def index      
    @search = ReportSearch.new(params[:search])
    @reports = @search.scope
  end
  
  def show
    date_end = params[:date_end]
    @count_child = Record.where(date_s: '20-nov-2018'..'25-nov-2018', age_range_id: 1).count
    @count_adult = Record.where(date_s: '20-nov-2018'..'25-nov-2018', age_range_id: 2).count    
  end
  
  def research    
    @total = Record.where(date_s: params[:begin]..params[:end]).count
    @count_child = Record.where(date_s: params[:begin]..params[:end], age_range_id: 1).count
    @count_adult = Record.where(date_s: params[:begin]..params[:end], age_range_id: 2).count
    
    @workers = Worker.all
    @workers_list = []
    @workers.each do |worker|
      worker_qtde = Record.joins(:attempts).where(date_s: params[:begin]..params[:end], 'attempts.worker_id' => worker).count    
      attempt_1 = Record.joins(:attempts).where(date_s: params[:begin]..params[:end], 'attempts.worker_id' => worker, 'attempts.try' => 1).count
      attempt_2 = Record.joins(:attempts).where(date_s: params[:begin]..params[:end], 'attempts.worker_id' => worker, 'attempts.try' => 2).count
      attempt_3 = Record.joins(:attempts).where(date_s: params[:begin]..params[:end], 'attempts.worker_id' => worker, 'attempts.try' => 3).count
      attempt_4 = Record.joins(:attempts).where(date_s: params[:begin]..params[:end], 'attempts.worker_id' => worker, 'attempts.try' => 4).count
      attempt_5 = Record.joins(:attempts).where(date_s: params[:begin]..params[:end], 'attempts.worker_id' => worker, 'attempts.try' => 5).count
      #worker_qtde = Attempt.find_by_sql("select a.id from attempts a inner join records r on a.record_id = r.id where r.date_s between '01-nov-2018' and '25-nov-2018' and a.worker_id = 1").count
      @workers_list << {description: worker.description, qtde: worker_qtde, try_1: attempt_1, try_2: attempt_2, try_3: attempt_3, try_4: attempt_4, try_5: attempt_5}
    end
    
    @observations = Observation.all
    @obs_list = []
    @observations.each do |observation|
      obs_qtde = Record.joins(:attempts).where(date_s: params[:begin]..params[:end], 'attempts.observation_id' => observation).count
      @obs_list << {description: observation.description, qtde: obs_qtde}
    end    
  end
end