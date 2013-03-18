class CompaniesController < ApplicationController

  PER_PAGE = 5

  before_filter :find_company, :only => [ :destroy, :update, :show, :edit ]

  before_filter :require_superadmin_login

  def index
    @search = Company.search do
      fulltext params[:search]
    end

    @companies = @search.results

    @companies = Company.paginate(:per_page => params[:per_page] || PER_PAGE,
                       :page => params[:page] || 1)
  end
  
  def new
    @company = Company.new
  end
  
  def update

    if @company.update_attributes params[:company]
      redirect_to companies_path(@company)
    else
      render :edit
    end
  end

  def create
    @company = Company.new params[:company]
      
    if @company.valid?
      @company.save
      redirect_to companies_path
    else
      render :new
    end
  end

  def destroy
    if @company
      @company.delete
    end
    redirect_to companies_path
  end

  protected

  def find_company
    @company = Company.find params[:id]
  end
end
