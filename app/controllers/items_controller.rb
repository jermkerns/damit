class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
    @filedata = @item.fileobj.image?
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    #@item.fileobj.attach(params[:fileobj])

    @item.filename = @item.fileobj.filename

    if(@item.fileobj.audio?)
      @item.filetype = "audio"
    elsif(@item.fileobj.image?)
      @item.filetype = "image"
      #@item.dimensions = @item.fileobj.metadata["width"] + " x " + @item.fileobj.metadata["height"]
    elsif(@item.fileobj.video?)
      @item.filetype = "video"
      #@item.dimensions = @item.fileobj.metadata["width"] + " x " + @item.fileobj.metadata["height"]
    elsif(@item.fileobj.text?)
      @item.filetype = "document"
    end
 
    #if(@item.fileobj.analyzed?)
      
    #end

    respond_to do |format|
      if @item.save
        #format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.html { redirect_to edit_item_path(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:filename, :filetype, :fileformat, :filesize, :dimensions, :content_description, :content_keywords, :file_date_created, :fileobj)
    end
end
