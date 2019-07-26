class VendorsController < ApplicationController
  load_and_authorize_resource

  def index
    @school = School.find_by(id: params[:school_id])
    @vendors = @school.try(:vendors) || Vendor
    @vendors = @vendors.search(params[:find])
  end

  def show
  end

  def new
    @vendor = Vendor.new
  end

  def edit
    if current_admin.id != @vendor.user_id
      flash[:notice] = "Sorry, you are not authorized to access this page."
      redirect_to root_path
    end
  end

  def create
    @vendor = Vendor.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to @vendor, notice: 'Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url, notice: 'Vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def authorize_page
    unless admin_signed_in?
      flash[:notice] = "Sorry, you are not authorized to access this page."
      redirect_to root_path
    end
  end

  private
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    def vendor_params
      params.require(:vendor).permit(:name, :email, :phone, :address, :website, :description, :content)
    end
end
