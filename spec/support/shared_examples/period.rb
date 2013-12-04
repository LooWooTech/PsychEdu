shared_examples 'period' do

  it 'should not shorter than 30 days' do
    subject.end_on = subject.start_on + 28.days
    expect(subject).to be_invalid
  end

  describe '#include_date?' do
    it 'returns true if the date is at the beginning of the period' do
      expect(subject).to be_include_date subject.start_on
    end

    it 'returns true if the date is at the end of the period' do
      expect(subject).to be_include_date subject.end_on
    end

    it 'returns true if the date is during the period' do
      expect(subject).to be_include_date subject.end_on - 1.day
    end

    it 'returns false if the date is after the end of the period' do
      expect(subject).not_to be_include_date subject.end_on + 1.day
    end

    it 'returns false if the date is before the beginning of the period' do
      expect(subject).not_to be_include_date subject.start_on - 1.day
    end
  end

  describe '#intersected?' do
    before do
      @new_period = FactoryGirl.build described_class.name.underscore
    end

    it 'returns true if one period starts on another\'s end date' do
      @new_period.start_on = subject.end_on
      @new_period.end_on = @new_period.start_on + 29.days
      expect(subject).to be_intersected @new_period
    end

    it 'returns true if one period starts during another' do
      @new_period.start_on = subject.end_on - 1.day
      @new_period.end_on = @new_period.start_on + 29.days
      expect(subject).to be_intersected @new_period
    end

    it 'returns true if one period ends on another\'s beginning' do
      @new_period.end_on = subject.start_on
      @new_period.start_on = @new_period.end_on - 29.days
      expect(subject).to be_intersected @new_period
    end

    it 'returns true if one period ends during another' do
      @new_period.end_on = subject.start_on + 1.day
      @new_period.start_on = @new_period.end_on - 29.days
      expect(subject).to be_intersected @new_period
    end

    it 'returns true if one period contains another' do
      @new_period.start_on = subject.start_on + 1.day
      @new_period.end_on = subject.end_on - 1.day
      expect(subject).to be_intersected @new_period
    end

    it 'returns false if they have no intersection' do
      @new_period.start_on = subject.end_on + 1.day
      @new_period.end_on = @new_period.start_on + 29.days
      expect(subject).not_to be_intersected @new_period
    end
  end

end
