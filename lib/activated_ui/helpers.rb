module ActivatedUI

  module Helpers

    def activated_link_to refs, name, url, link_options={}
      refs = [refs] if refs.is_a? Symbol # If we're given a symbol make it an array
      link_options[:class] = "#{link_options[:class]} #{activated_class(*refs)}".strip
      link_to(name, url, link_options)
    end

  end

end