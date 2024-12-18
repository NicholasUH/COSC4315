require_relative '../scheduler.rb'

RSpec.describe 'Schedule tests' do
  it 'returns true' do
    expect(true).to eq(true)
  end

  it 'returns a meeting with no arguments' do
    result = schedule meeting
    
    expect(result).to eq("Meeting: ")
  end

  it 'returns a meeting with the provided name' do
    result = schedule meeting {
      name 'early admissions'
    }
    
    expect(result).to eq("Meeting: early admissions")
  end

  it 'returns a meeting with the provided name and start time' do
    result = schedule meeting {
      name 'early admissions'
      starts 1430
    }
    
    expect(result).to eq("Meeting: early admissions, Start Time: 14:30")
  end

  it 'returns a meeting with the provided name, start time, and end time' do
    result = schedule meeting {
      name 'early admissions'
      starts 1430
      ends 1530
    }
  
    expect(result).to include("Meeting: early admissions, Start Time: 14:30, End Time: 15:30")
  end
  
  it 'returns a meeting with the provided name, start time, end time, and duration' do
    result = schedule meeting {
      name 'early admissions'
      starts 1430
      ends 1530
    }
  
    expect(result).to eq("Meeting: early admissions, Start Time: 14:30, End Time: 15:30, Duration: 1 hour and 0 minutes")
  end
  
  it 'returns a meeting with the provided name, start time, end time, and date' do
    result = schedule meeting {
      name 'early admissions'
      starts 1430
      ends 1530
      on 10/15/2018
    }
    
    expect(result).to eq("Meeting: early admissions, Start Time: 14:30, End Time: 15:30, Duration: 1 hour and 0 minutes, Date: 10/15/2018")
  end

  it 'returns a meeting with the provided name, start time, end time, date, and participants' do
    result = schedule meeting {
      name 'early admissions'
      starts 1430
      ends 1530
      on 10/15/2018
      participating 'Kim R.', 'Mike B.', 'Paula P.', 'Chin Z.'
    }
    
    expect(result).to eq("Meeting: early admissions, Start Time: 14:30, End Time: 15:30, Duration: 1 hour and 0 minutes, Date: 10/15/2018, 4 Participants, Participants: Kim R., Mike B., Paula P., Chin Z.")
  end
end
