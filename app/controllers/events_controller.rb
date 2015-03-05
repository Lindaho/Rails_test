class EventsController < ApplicationController
	# 列表頁
	def index
		@events = Event.page(params[:page]).per(5)

		respond_to do |format|
			format.html
			format.xml { render :xml => @events.to_xml }
			format.json { render :json => @events.to_json }
			format.atom { @feed_title = "My event list" }
		end
	end

	# 新增
	def new
		@event = Event.new
	end

	# Save
	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "event was successfully created"
			redirect_to events_url
		else
			render :action => :new
		end
	end

	# 檢視
	def show
		find
		@page_title = @event.name
	end

	# 修改
	def edit
		find
	end

	# Update
	def update
		@event = Event.find(params[:id])
		if @event.update(event_params)
			flash[:notice] = "event was successfully updated"
			redirect_to event_url(@event)
		else
			render :action => :edit
		end
	end

	# 刪除
	def destroy
		@event = find
		@event.destroy
		flash[:alert] = "event was successfully deleted"

		redirect_to :action => :index
	end

	private

	def event_params
		params.require(:event).permit(:name,:desc)
	end

	def find
		@event = Event.find(params[:id])
	end
end
