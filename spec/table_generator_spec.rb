require 'spec_helper'

RSpec.describe ArithmeticTable::TableGenerator do
  describe 'validations' do
    describe '#validate_attributes!' do
      it 'validates sequence_generator dependency injections interface' do
        subject.send(:sequence_generator=, double(:sequence_generator))
        expect { subject.validate_attributes! }.to(
            raise_error(':sequence_generator must implement #generate')
        )
      end

      it 'validates matrix_calculator dependency injections interface' do
        subject.send(:matrix_calculator=, double(:matrix_calculator))
        expect { subject.validate_attributes! }.to(
            raise_error(':matrix_calculator must implement #calculate')
        )
      end

      it 'validates table_printer dependency injections interface' do
        subject.send(:table_printer=, double(:table_printer))
        expect { subject.validate_attributes! }.to(
            raise_error(':table_printer must implement #print')
        )
      end
    end

    it 'validates the type of the options attribute' do
      expect { described_class.new(options: '') }.to(
        raise_error(':options param must be provided as Hash')
      )
    end
  end

  describe '#generate' do
    it 'will call each of its depedencies once' do
      expect(subject.sequence_generator).to receive(:generate).once
      expect(subject.matrix_calculator).to receive(:calculate).once
      expect(subject.table_printer).to receive(:print).once
      subject.generate
    end
  end
end