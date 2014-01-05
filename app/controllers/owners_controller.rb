class OwnersController < ApplicationController
	before_action :set_owner, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
		@owner = Owner.find(params[:id])
	end

	def new
		@owner = Owner.new
	end

	def edit
		@owner = Owner.find(params[:id])
	end

	def create
		@owner = Owner.new(owner_params)

		if @owner.save
			redirect_to owner_path(@owner),
				notice: "Owner created successfully!"
		else
			render :new
		end
	end

	def update
		@owner = Owner.new(owner_params)

		if @owner.update(owner_params)
			redirect_to owner_path(@owner), notice: 'Owner was successfully updated!'
		else
			render action: 'edit'
		end
	end

	def destroy
		Owner.find(params[:id]).destroy
		redirect_to owner_path, notice: "Owner was successfully destroyed"
	end

	private
	def set_owner
		@owners = Owner.find(params[:id])
	end

	def owner_params
		params.require(:owner).permit(:first_name, :last_name, :email, :company_name)
	end


end
