class ToysController < ApplicationController
    def index
        # /cats/:cat_id/toys
        cat = Cat.find(params[:cat_id])
        render json: cat.toys
    end

    def show
        # /cats/:cat_id/toys/:id    ==> redundant
        # /toys/:id                 ==> preferable, since you already need the toy_id
        render json: Toy.find(params[:id])
    end

    def create
        # POST /cats/:cat_id/toys
        # POST /toys
        @toy = Toy.new(toy_params)
        @cat = @toy.cat
        # toy.cat_id = params[:cat_id]

        if @toy.save
            redirect_to cat_url(@cat)
        else
            render :new
            # render json: toy.errors.full_messages, status: :unprocessable_entity
        end 
    end

    def destoy
        # /toys/:id 
        toy = Toy.find(params[:id])
        toy.destroy
        render json: toy
    end

    def edit
        
    end

    def update
        # /toys/:id 
         toy = Toy.find(params[:id])

         success = toy.update(toy_params)

         if success
            render json: toy
         else
            render  json: toy.errors.full_messages, status: :unprocessable_entity
         end
    end

    def new
        @cat = Cat.find(params[:cat_id])
        @toy = Toy.new
        render :new
    end
    private

    def toy_params
        params[:toy].permit(:cat_id, :name, :ttype)
    end
end