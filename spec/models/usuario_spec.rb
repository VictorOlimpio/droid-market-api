require 'rails_helper'

RSpec.describe Usuario do

  subject { Usuario.new }

  describe 'validations' do
    it { is_expected.to have_many(:demandas) }
  end
end
