require 'rails_helper'

RSpec.describe Peca, type: :model do

  subject { Peca.new }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:valor) }
    it { is_expected.to define_enum_for(:tipo).with(Peca.tipos.keys) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:demandas) }
  end
end
