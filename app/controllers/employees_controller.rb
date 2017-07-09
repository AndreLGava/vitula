class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    if params[:property_id].nil?
      @employees = Employee.them(current_user.properties.ids, params[:page])
    else
      @property = Property.find(params[:property_id])
      @employees = Employee.them(@property.id, params[:page])
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @property = Property.find(params[:property_id])
    @employee = @property.employees.new
    @employee.financials.build
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    set_data

    respond_to do |format|
      if @employee.save
        format.js { render 'properties/property_employees', property: @property, employees: @employees}
      else
        format.js { render 'new' }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update

    set_data

    respond_to do |format|
      if @employee.update(employee_params)
        format.js { render 'properties/property_employees', property: @property, employees: @employees}
      else
        format.js { render 'edit' }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy

    set_data

    @employee.destroy
    respond_to do |format|
      format.js { render 'properties/property_employees', property: @property, employees: @employees}
    end
  end

  private
    def set_data
      @property = Property.find(@employee.property_id)
      @employees = Employee.them(@property, params[:page])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
      acesso(@employee.property.user_id, root_path)
      @financials = @employee.financials
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:work, :name, :startwork, :endwork, :born, :phone, :rg, :cpf, :schooling, :inss, :pis, :salary, :profession, :payment, :property_id)
    end
end
