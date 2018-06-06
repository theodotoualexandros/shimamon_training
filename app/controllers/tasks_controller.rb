class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tasks
  # GET /tasks.json
  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result.includes(:groups).where(groups: { id: current_user.groups.ids } )
    @tasks = @tasks.page(params[:page]).per(10)
    if (!current_user.nil?)
      @tasks.each do |task|
        existing_notification = Notification.where(user_id: current_user.id, task_id: task.id)
        if existing_notification.nil?
          if (task.deadline < Date.today) then
            Notification.create!({ user_id: current_user.id, notification_type_id: 2, task_id: task.id})
          elsif (((Time.zone.now - task.deadline) / 1.day).to_i < 3) then
            Notification.create!({ user_id: current_user.id, notification_type_id: 1, task_id: task.id})
          end
        end
      end
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @labels = Label.all
  end

  # GET /tasks/1/edit
  def edit
    @labels = @task.labels
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.creator_id = current_user.id

    respond_to do |format|
      if @task.valid?
        if @task.save
          #if @task.deadline < Date.today
            #Notification.create!({ user_id: current_user.id, notification_type_id: 2, task_id: @task.id})
          #end
          format.html { redirect_to @task, notice: 'Task was successfully created.' }
          format.json { render :show, status: :created, location: @task }
        else
          format.html { render :new }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        #if @task.deadline < Date.today
          #Notification.create!({ user_id: current_user.id, notification_type_id: 2, task_id: @task.id})
        #end
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :deadline, :status_id, :priority, {label_ids: []}, {group_ids: []})
    end

end
