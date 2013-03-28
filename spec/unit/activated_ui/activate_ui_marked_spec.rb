require 'spec_helper'

describe ActivatedUI do

  include ActivatedUI

  describe '#activate_ui_marked' do

    it "adds a single passed symbol into stored_activated_ui" do
      activate_ui_marked :a_symbol
      stored_activated_ui.should eq [:a_symbol]
    end

    it "adds a multiple arguments" do
      activate_ui_marked :a_symbol, :another_symbol, :and_another
      stored_activated_ui.should eq [:a_symbol, :another_symbol, :and_another]
    end

    it "stacks values onto existing values" do
      activate_ui_marked :a_symbol
      activate_ui_marked :another_symbol
      activate_ui_marked :and_another
      stored_activated_ui.should eq [:a_symbol, :another_symbol, :and_another]
    end

    it "returns stored_activated_ui" do
      returned_value = stored_activated_ui
      activate_ui_marked(:something).should be returned_value
    end

  end

end