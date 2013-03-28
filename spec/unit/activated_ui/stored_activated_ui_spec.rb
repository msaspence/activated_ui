require 'spec_helper'

describe ActivatedUI do

  include ActivatedUI

  describe '#stored_activated_ui' do

    it "returns an empty array if @stored_activated_ui is not yet set" do
      stored_activated_ui.should eq []
    end

    it "returns an @stored_activated_ui if its been set" do
      returned_value = stored_activated_ui
      stored_activated_ui.should be returned_value
    end

  end

end