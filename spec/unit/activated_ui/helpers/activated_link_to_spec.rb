require 'spec_helper'

describe ActivatedUI::Helpers do

  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActivatedUI
  include ActivatedUI::Helpers

  describe '#activated_link_to' do

    context "when the ui is activated" do

      before :each do
        should_receive(:ui_activated?).with(:a_symbol).and_return(true)
      end

      it "returns a link with a custom active class" do
        self.class.activated_class "my_active_class"
        activated_link_to(:a_symbol, "Link text", 'http://example.com').should eq '<a class="my_active_class" href="http://example.com">Link text</a>'
      end

      it "returns a link with 'active' class if there isn't a configured class" do
        self.class.activated_class false # Giving it false returns to default
        activated_link_to(:a_symbol, "Link text", 'http://example.com').should eq '<a class="active" href="http://example.com">Link text</a>'
      end

      it "gives additional arguments to link_to" do
        link_text, link_url, link_options = "Link text", "http://example.com", { :class => "my_class" }
        should_receive(:link_to).with(link_text, link_url, link_options)
        activated_link_to(:a_symbol, link_text, link_url, link_options)
      end

      it "adds the active class to link_to's options" do
        self.class.activated_class false # Giving it false returns to default
        link_text, link_url, link_options = "Link text", "http://example.com", { :class => "my_class" }
        should_receive(:link_to).with(link_text, link_url, { :class => "my_class active" })
        activated_link_to(:a_symbol, link_text, link_url, link_options)
      end

      it "handles no provided class" do
        self.class.activated_class false # Giving it false returns to default
        link_text, link_url, link_options = "Link text", "http://example.com", { }
        should_receive(:link_to).with(link_text, link_url, { :class => "active" })
        activated_link_to(:a_symbol, link_text, link_url, link_options)
      end

    end

    context "when the ui isn't activated" do

      before :each do
        should_receive(:ui_activated?).with(:not_the_symbol).and_return(false)
      end

      it "returns a link with no addition to the class" do
        self.class.activated_class false # Giving it false returns to default
        activated_link_to(:not_the_symbol, "Link text", 'http://example.com').should eq '<a class="" href="http://example.com">Link text</a>'
      end

    end

  end

end