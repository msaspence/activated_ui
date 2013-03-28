require 'spec_helper'

describe ActivatedUI do

  include ActivatedUI

  describe '#activated_class' do

    context "when the ui is activated" do

      before :each do
        should_receive(:ui_activated?).with(:a_symbol).and_return(true)
      end

      it "return the configured active class" do
        self.class.activated_class "my_active_class"
        activated_class(:a_symbol).should eq "my_active_class"
      end

      it "returns 'active' if there isn't a configured class" do
        self.class.activated_class false # Giving it false returns to default
        activated_class(:a_symbol).should eq "active"
      end

    end

    context "when the ui isn't activated" do

      before :each do
        should_receive(:ui_activated?).with(:not_the_symbol).and_return(false)
      end

      it "returns an empty string" do
        activated_class(:not_the_symbol).should eq ""
      end

    end

  end

end