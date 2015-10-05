require 'spec_helper'

describe ActivatedUI do

  include ActivatedUI

  describe '#ui_activated?' do

    before :each do
      should_receive(:stored_activated_ui).at_least(:once).and_return([:a, :b, :c])
    end

    it "returns true if the provided key is present in #stored_activated_ui" do
      ui_activated?(:a).should be true
    end

    it "returns false if the provided keys isn't present in #stored_activated_ui" do
      ui_activated?(:d).should be false
    end

    it "returns false if none of the provided keys are present in #stored_activated_ui" do
      ui_activated?(:d, :e).should be false
    end

    it "returns false if not all of the provided keys are present in #stored_activated_ui" do
      ui_activated?(:a, :d).should be false
    end

    it "returns true if the provided key is present in #stored_activated_ui" do
      ui_activated?(:a).should be true
    end

    it "returns true if all the provided key are present in #stored_activated_ui" do
      ui_activated?(:a, :b).should be true
    end

  end

end