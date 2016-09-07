class StepsController < ApplicationController
  #before_action :set_step, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  
  # GET /steps
  # GET /steps.json
  def index 
    @steps = Goal.find(params[:goal_id]).steps.all
  end 

  # GET /goals/1/steps/new
  def new
    @goal = Goal.find(params[:goal_id])
    @step = @goal.steps.build
  end 

  def show
    @step = Step.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:goal_id])
    @step = Step.find(params[:id])
  end

  def get_goal
    @goal = Goal.find(params[:goal_id]) if params[:goal_id]
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @step = @goal.steps.new(step_params)

    respond_to do |format|
      if @step.save
        format.html { redirect_to  goal_path(@goal), notice: 'Step was successfully created.' }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end 

  def update 
    @goal = Goal.find(params[:goal_id])
    @step = Step.find(params[:id])
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to goal_path(@goal), notice: 'Step was successfully updated.' }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end 

  # POST /steps
  # POST /steps.json
  
  def destroy
    @goal = Goal.find(params[:goal_id])
    @step = Step.find(params[:id])
    @step.destroy
    respond_to do |format|
      format.html { redirect_to goal_path(@goal), notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_step 
      @step = Goal.find(params[:goal_id]).Step.find(params[:id])
    end 

    def step_params 
      params.require(:step).permit(:requirement, :completionTime, :goal_id) 
    end 

  end



