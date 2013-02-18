class StacksController < ApplicationController
  # devise authentication
  before_filter :authenticate_user!, except: [:index]

  # GET /stacks
  # GET /stacks.json
  def index
    @stacks = Stack.order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stacks }
    end
  end


  # GET /stacks/1
  # GET /stacks/1.json
  def show
    @stack = Stack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stack }
    end
  end



  # GET /stacks/new
  # GET /stacks/new.json
  def new
    @stack = current_user.stacks.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stack }
    end
  end

  # GET /stacks/1
  # GET /stacks/1/edit
  def edit
    @stack = current_user.stacks.find(params[:id])
  end

  # POST /stacks
  # POST /stacks.json
  def create
    @stack = current_user.stacks.new(params[:stack])

    respond_to do |format|
      if @stack.save
        format.html { redirect_to @stack, notice: 'Stack was successfully created.' }
        format.json { render json: @stack, status: :created, location: @stack }
      else
        format.html { render action: "new" }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stacks/1
  # PUT /stacks/1.json
  def update
    @stack = current_user.stacks.find(params[:id])

    respond_to do |format|
      if @stack.update_attributes(params[:stack])
        format.html { redirect_to @stack, notice: 'Stack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stacks/1
  # DELETE /stacks/1.json
  def destroy
    @stack = current_user.stacks.find(params[:id])
    @stack.destroy

    respond_to do |format|
      format.html { redirect_to stacks_url }
      format.json { head :no_content }
    end
  end
end
