class ToDosController < ApplicationController

  def index
    @to_dos = ToDo.all :order => "due_on"
  end

  def show
    @to_do = ToDo.find params[:id]
  end

  def new
    @to_do = ToDo.new
  end

  def create
    @to_do = ToDo.new params[:to_do]

    if @to_do.save
      flash[:notice] = "Todo successfully created."
      redirect_to to_dos_path
    else
      flash[:error] = @to_do.errors.full_messages.to_sentence
      render :action => "new"
    end
  end

  def edit
    @to_do = ToDo.find params[:id]
  end

  def update
    @to_do = ToDo.find params[:id]

    if @to_do.update_attributes(params[:to_do])
      flash[:notice] = "Todo successfully updated."
      redirect_to to_dos_path
    else
      flash[:error] = @to_do.errors.full_messages.to_sentence
      render :action => "edit"
    end
  end

  def destroy
    ToDo.find(params[:id]).destroy
    flash[:notice] = "Todo successfully removed."
    redirect_to to_dos_path
  end

end
