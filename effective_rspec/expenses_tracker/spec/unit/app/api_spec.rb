require_relative '../../../app/api'
require 'rack/test'

module ExpenseTracker
  RecordResult = Struct.new(:success?, :expense_id, :error_message)
  
  RSpec.describe API do
    include Rack::Test::Methods
    
    def app
      API.new(ledger: ledger)
    end
    
    let(:ledger) { instance_double('ExpenseTracker::Ledger') }
    
    describe 'POST /expenses' do
      let(:expense) { {'some' => 'data'} }
      
      before do
        allow(ledger).to receive(:record)
          .with(expense)
          .and_return(RecordResult.new(true, 417, nil))
      end

      context 'when expense is successfully recorded' do
        it 'responds with a status 200 (OK)' do
          post '/expenses', JSON.generate(expense)          
          expect(last_response.status).to eq(200)
        end

        it 'returns an expense id' do
          post '/expenses', JSON.generate(expense)
          
          parsed = JSON.parse(last_response.body)
          expect(parsed).to include('expense_id' => 417)
        end
      end
      
      context 'when expense fails validation' do
        let(:expense) { {'some' => 'data'} }
        
        before do
          allow(ledger).to receive(:record)
            .with(expense)
            .and_return(RecordResult.new(false, 417, 'Expense incomplete'))
        end

        it 'responds with 422 (Unprocessible)' do
          post '/expenses', JSON.generate(expense)
          expect(last_response.status).to eq(422)
        end

        it 'returns an error' do
          post '/expenses', JSON.generate(expense)
          
          parsed = JSON.parse(last_response.body)
          expect(parsed).to include('error' => 'Expense incomplete')
        end
      end
    end
  end
end
