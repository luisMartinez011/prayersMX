require "cancan/matchers"

describe "Productos" do
    describe "abilities" do
      subject(:ability) { Ability.new(user) }
      let(:user) { nil }
  
      context "when is an account manager" do
       
  
        it { is_expected.to be_able_to(:manage, Producto.new) }
      end
    end
end