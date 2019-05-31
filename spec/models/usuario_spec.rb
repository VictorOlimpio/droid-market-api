require 'rails_helper'

RSpec.describe Usuario, type: :model do

  subject { create :usuario }

  describe 'validations' do
    it { is_expected.to validate_inclusion_of(:tipo).in_array(Usuario.tipos.keys) }
    it { is_expected.to validate_presence_of(:nome) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:demandas) }
  end
end
