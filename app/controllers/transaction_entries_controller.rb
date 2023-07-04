class TransactionEntriesController < ApplicationController
	def new
		@transaction_entry = TransactionEntry.new
	end

	def show
		@transaction_entry = TransactionEntry.find(params[:id])
	end

	def create
		@transaction_entry = TransactionEntry.new(transaction_entry_params)
		@transaction_entry.user = current_user

		respond_to do |format|
			if @transaction_entry.save
				format.html {redirect_to transaction_entry_path(@transaction_entry), notice: 'Transaction created successfully!'}
				format.json {render :show, status: :created, location: @transaction_entry}
			else
				format.html {render :new, flash {error: 'Transaction not created!'}}
				format.json {render json: @transaction_entry.errors, status: :unprocessable_entity}
			end
		end
	end

	private

	def transaction_entry_params
		params.require(:transaction_entry).permit(:name, :amount, :transaction_categories)
	end
end
