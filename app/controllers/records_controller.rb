class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_action :set_age_range_options, only: [:new, :create, :edit, :update]
  before_action :set_attempt, only: [:show]

  # GET /records
  # GET /records.json
  def index    
    @i = 0
    @search = RecordSearch.new(params[:search])
    @records = @search.scope
    @records = Record.all.order(id: :desc)
  end
  
  def index_search
    @search = RecordSearch.new(params[:search])
    @records = @search.scope
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @try = Attempt.where("record_id = ?", @record.id).count
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end
    
    def set_attempt
      @attempts = Attempt.where("record_id = ?", @record.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:date_s, :protocol, :patient, :age_range_id, :age)
    end
    
    def set_age_range_options
      @age_range_options = AgeRange.all.pluck(:description, :id)
    end
end
