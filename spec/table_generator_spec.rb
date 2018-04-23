require 'spec_helper'

RSpec.describe ArithmeticTable::TableGenerator do
  describe '#generate' do
    it 'will call each of its depedencies once' do
      expect(subject.sequence_generator).to receive(:call).once
      expect(subject.matrix_calculator).to receive(:call).once
      expect(subject.table_printer).to receive(:call).once
      subject.generate
    end
  end
end
