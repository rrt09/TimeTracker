class WorksController < ApplicationController
def index
	if (params[:days])
		@works = Work.recentdays(params[:days]).order('dateimperformed desc')
		
	else
		@works = Work.all.order('dateimperformed')
	end
end

	def show
		@work = Work.find(params[:id])
	end

	def new
		@work = Work.new
	end

	def create
		@work = Work.new(params[:work].permit(:project_id,:user_id,:dateimperformed,:hours))
		if @work.save
			flash[:notice] = 'Wrok Created'
			redirect_to @work
		else
			render 'new'
		end
	end

	def edit
		@work = Work.find(params[:id])
	end

	def update
		@work = Work.find(params[:id])

		if @work.update(params[:work].permit(:project_id,:user_id,:dateimperformed,:hours))
			flash[:notice] = 'Company Updated'
			redirect_to @work
		else
			render 'edit'
		end
	end
end