require 'rails_helper'

RSpec.describe Usuario, type: :model do

  subject { create :usuario }

  describe 'validations' do
    it { is_expected.to define_enum_for(:tipo).with(Usuario.tipos.keys) }
    it { is_expected.to validate_presence_of(:nome) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:demandas) }
  end
end
