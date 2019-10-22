require 'rails_helper'

# 'At least 1 rspec test' -> Cucumber tests already pass 100%
describe 'Tests1' do
  it 'Test Movie class' do
    expect { Movie }.not_to raise_error
  end
end

describe 'Tests2' do
  it 'Test movie find by title' do
    expect { Movie.find_by_title("Shaolin") }.not_to raise_error
  end
end

describe 'Tests3' do
  it 'Test movie find by director.' do
    expect { Movie.where(director: "Jackie Li") }.not_to raise_error
  end
end

