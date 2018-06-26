require_relative '../services/test_dbs_api.rb'

class OperationsController < ApplicationController
  before_action :set_operation, only: [:show, :edit, :update, :destroy]


  def index
    @operations = Operation.all
    @test_dbs_api = TestApi.new
    @auth_url = @test_dbs_api.dbs_auth_url
    @grab_dbs_auth_code = params.require(:code) if params.has_key?(:code)
    @access_token = @test_dbs_api.generate_access_token(@grab_dbs_auth_code) if params.has_key?(:code)
  end

  def new
    @operation = Operation.new
  end

  def create
    @operation = Operation.new(operation_params)
    @operation.user = current_user
    if @operation.save
      redirect_to operations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @operation.update(operation_params)
    redirect_to operations_path
  end

  def destroy
    @operation.delete
    redirect_to operations_path
  end


  private

  def operation_params
    params.require(:operation).permit(:title, :amount, :date, :approved, :note)
  end

  def set_operation
    @operation = Operation.find(params[:id])
  end

end
