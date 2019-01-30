class CatsController < ApplicationController
	def index
		# GET /cats
		# render json: Cat.all  #show all the cats
		@cats = Cat.all
		render :index
	end

	def show 
		# GET /cats/123
		# render json: Cat.find(params[:id]) #show the cat for that ID
		@cat = Cat.find(params[:id])
		render :show
	end

	# Creating a cat with an invalid input
		# 1) Get /cats/new to fetch a form
		# 2) User fills out form incorrectly, clicks submit
		# 3) Validation fails
		# 4) Server renders "new" template again
		# 5) The form is filled in with @cat data

	def create
		@cat = Cat.new(cat_params)

		if @cat.save
			# cat_url(@cat) == /cat/{@cat.id}
			redirect_to cat_url(@cat)
		else
			render :new
			# render json: @cat.errors.full_messages, status: :unprocessable_entity
		end 
	end 

	# Creating a new cat is a multi-step process:dds
		# 1) Get /cats/new to fetch a form
		# 2) User fills out form, clicks submit
		# 3) POST /cats the data in the form
		# 4) Create action is invoked, cat is created
		# 5) Send client a redirect to /cats/#{id}
		# 6) Client makes a GET request for /cats/#{id}
		# 7) Show actions for newly created cat is invoked

	def new
		# /cats/new
		# show a form to create a new object
		@cat = Cat.new
		render :new
	end

	def update
		@cat = Cat.find(params[:id])
		if @cat.update(cat_params)
			redirect_to cat_url(@cat)
		else
			render :edit
		end
	end

	def edit
		# /cats/:id/edit
		# show a form to edit an existing object
		@cat = Cat.find(params[:id])
		render :edit
	end

	def destroy
		# DELETE /cats/:id
		cat = Cat.find(params[:id])
		cat.destroy
		redirect_to cats_url

		#1 Get /cats
		#2 Click delete buttom
		#3 Sends POST /cats/1; but _method="DELETE" so rails understands to destroy
		#4 Destroys the cat. Issues a redirect to the client.
		#5 Client GETS /cats again
	end

	private
	def cat_params
        params[:cat].permit(:name, :skill)
    end
end