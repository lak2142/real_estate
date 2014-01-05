class BuildingsController < ApplicationController

	before_action :set_building, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
		@building = Building.find(params[:id])
	end

	def new
		@building = Building.new
	end

	def edit
		@building = Building.find(params[:id])
	end

	def create
		@building = Building.new(building_params)

		if @building.save
			redirect_to building_path(@building),
				notice: "Building created successfully!"
		else
			render :new
		end
	end

	def update
		@building = Building.new(building_params)

		if @building.update(building_params)
			redirect_to building_path(@building), notice: 'Building was successfully updated!'
		else
			render action: 'edit'
		end
	end

	def destroy
		Building.find(params[:id]).destroy
		redirect_to building_path, notice: "Building was successfully destroyed"
	end

	private
	def set_building
		@buildings = Building.find(params[:id])
	end

	def building_params
		params.require(:building).permit(:street_address, :city, :state, :postal_code)
	end


end