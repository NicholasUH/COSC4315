require_relative '../perfect_number'

RSpec.describe 'Canary test' do
    it 'returns true' do
        expect(true).to eq(true)
    end
end

RSpec.describe '#is_perfect_number_imperative' do
    context 'when input is a perfect number' do
        [6, 28, 496].each do |number|
            it "returns true for #{number}" do 
                expect(is_perfect_number_imperative(number)).to be_truthy
            end
        end
    end

    context 'when input is not a perfect number' do
        [5, 12, 8129, 1, -1, 0].each do |number|
            it "returns false for #{number}" do
                expect(is_perfect_number_imperative(number)).to be_falsey
            end
        end
    end
end

RSpec.describe '#is_perfect_number_functional' do
    context 'when input is a perfect number' do
        [6, 28, 496].each do |number|
            it "returns true for #{number}" do 
                expect(is_perfect_number_functional(number)).to be_truthy
            end
        end
    end

    context 'when input is not a perfect number' do
        [5, 12, 8129, 1, -1, 0].each do |number|
            it "returns false for #{number}" do
                expect(is_perfect_number_functional(number)).to be_falsey
            end
        end
    end
end
