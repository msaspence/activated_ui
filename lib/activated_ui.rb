module ActivatedUI

  def self.included(base)

    # If the module is being included on a an Rails controller
    if defined?(ActionController::Base) && (base < ActionController::Base)

      base.helper_method :activated_class, :activate_ui_marked, :stored_activated_ui, :ui_activated, :ui_activated?

      def base.activate_ui_marked *refs
        params = refs.last.is_a?(Array) ? refs.pop : {}
        before_filter params do
          activate_ui_marked *refs
        end
      end

      if defined?(ActionView::Base)
        ActionView::Base.send :include, ActivatedUI::Helpers
      end

    end

    def base.activated_class value=nil
      @activated_class = value unless value.nil?
      @activated_class || 'active'
    end

  end


  def activated_class *refs
    if ui_activated? *refs
      self.class.activated_class
    else
      ""
    end
  end

  def activate_ui_marked *refs
    refs.each do |ref|
      stored_activated_ui << ref
    end
    stored_activated_ui
  end

  def stored_activated_ui
    @stored_activated_ui ||= []
  end

  def ui_activated? *refs
    all_match = true
    refs.each do |ref|
      all_match &&= stored_activated_ui.include?(ref)
    end
    all_match
  end
  alias :ui_activated :ui_activated?

end

require 'activated_ui/helpers'
