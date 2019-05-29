require 'rails_helper'

RSpec.describe Usuario, type: :model do

  subject { Usuario.new }

  describe 'validations' do
    # it { is_expected.to validate_inclusion_of(:tipo).in_array(Usuario.tipos.keys) }
    it { is_expected.to validate_presence_of(:nome) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_uniqueness_of(:cpf) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:demandas) }
  end
end
