class SheltersController < ApplicationController

  def show
    @shelter = Shelter.find(params[:id])
  end

  def edit
  end

  def create
    @shelter = Shelter.new(shelter_params)

    respond_to do |format|
      if @shelter.save
        format.html { redirect_to @shelter, notice: 'Shelter was successfully created.' }
        format.json { render :show, status: :created, location: @shelter }
      else
        format.html { render :new }
        format.json { render json: @shelter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shelter.update(shelter_params)
        format.html { redirect_to @shelter, notice: 'Shelter was successfully updated.' }
        format.json { render :show, status: :ok, location: @shelter }
      else
        format.html { render :edit }
        format.json { render json: @shelter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shelter.destroy
    respond_to do |format|
      format.html { redirect_to shelters_url, notice: 'Shelter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end 
