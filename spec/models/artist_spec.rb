require 'rails_helper'

RSpec.describe Artist, type: :model do
  it { is_expected.to have_many(:albums).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:year) }

  describe "#lowercase_name" do
    context "with a Capitalized name" do
      before { @a = Artist.create(name: 'Queen') }
      it { expect(@a.lowercase_name).to eq('queen') }
    end

    context "with an UPPERCASE name" do
      before { @a = Artist.create(name: 'QUEEN') }
      it { expect(@a.lowercase_name).to eq('queen') }
    end

    context "with an lowercase name" do
      before { @a = Artist.create(name: 'queen') }
      it { expect(@a.lowercase_name).to eq('queen') }
    end

    context "with a number at the beginning" do
      before { @a = Artist.create(name: '1queen') }
      it { expect(@a.lowercase_name).to eq('1queen') }
    end
  end
end
