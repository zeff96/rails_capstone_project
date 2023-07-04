class TransactionEntriesController < ApplicationController
	def new
		@transaction_entry = TransactionEntry.new
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
end
