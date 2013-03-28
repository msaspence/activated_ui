require 'spec_helper'

class MockActivatedUIController < ActionController::Base
  include ActivatedUI
end

describe ActivatedUI do


  describe 'self.activated_class' do

    subject { MockActivatedUIController }

    it "adds activated_class class method to set and get active class" do
      subject.activated_class.should eq 'active'
      subject.activated_class('my_active').should eq 'my_active'
      subject.activated_class.should eq 'my_active'
      subject.activated_class(false).should eq 'active'
      subject.activated_class.should eq 'active'
    end

  end

  describe 'helper methods' do

    it "sets some of its methods as view helpers" do
      class MockActivatedUIController2 < ActionController::Base ; end
      MockActivatedUIController2.should_receive(:helper_method).with(:activated_class, :activate_ui_marked, :stored_activated_ui, :ui_activated, :ui_activated?)
      class MockActivatedUIController2 < ActionController::Base
        include ActivatedUI
      end
    end

    it "adds ActivatedUI::Helpers to ActionView::Base" do
      ActionView::Base.should_receive(:include).with(ActivatedUI::Helpers)
      class MockActivatedUIController3 < ActionController::Base
        include ActivatedUI
      end
    end

    it "doesn't add ActivatedUI::Helpers to ActionView::Base if its not ActionController::Base" do
      ActionView::Base.should_not_receive(:include).with(ActivatedUI::Helpers)
      class MockActivatedUIController4
        include ActivatedUI
      end
    end

  end

end