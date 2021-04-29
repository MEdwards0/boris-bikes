require 'bike.rb'

describe Bike do
  it "bike responds to working" do
    expect(subject).to respond_to :working?
  end
    
  it 'User can report bike broken' do
    expect(subject.report_broken).to eq(true)
  end
  
  it 'User can report bike is broken' do
    subject.report_broken
    expect(subject.broken?).to eq(true)
  end
  
  it '.working equals true by default' do
    expect(subject.working?).to eq(true)
  end
  
  it 'Reporting bike broken changes .working?' do
    subject.report_broken
    expect(subject.working?).to eq(false)
  end
end
