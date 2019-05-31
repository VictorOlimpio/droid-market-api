require 'rails_helper'

RSpec.describe Peca, type: :model do

  subject { Peca.new }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:valor) }
    it { is_expected.to validate_inclusion_of(:tipo).in_array(Peca.tipos.keys) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:demandas) }
  end
end
