# ActivatedUI

[![Build Status](https://travis-ci.org/msaspence/activated_ui.png?branch=master)](https://travis-ci.org/msaspence/activated_ui)
[![Code Climate](https://codeclimate.com/github/msaspence/activated_ui.png)](https://codeclimate.com/github/msaspence/activated_ui)
[![Dependency Status](https://gemnasium.com/msaspence/activated_ui.png)](https://gemnasium.com/msaspence/activated_ui)

ActivatedUI, is a collection of helpers to set and manage the active state of UI elements. It is similar to [active\_link\_to](https://github.com/twg/active_link_to) in that it is designed to help control the active state of UI elements for you. However where active\_link\_to infers the active state from the current url, ActivatedUI enables you to explicitly state it.


## Installation

When installing for Rails 3 applications add this to the Gemfile: `gem 'activated_ui'` and run `bundle install`.

ActivatedUI _should_ work without rails, but I have to admit I haven't really used it in this environment.

## Usage

### Setting the Active State

You can define the active state with:

    activate_ui_marked :my_key # active state is [:my_key]

You can give it as many keys at a time as you like:

    activate_ui_marked :my_key, :another_key # active state is [:my_key, :another_key]

`activate_ui_marked` builds on itself like so:

    activate_ui_marked :my_key # active state is [:my_key]
    activate_ui_marked :another_key # active state is now [:my_key, :another_key]

### Getting the Active State

Once you have set the active state there are a number of ways you can use it:

Find if a key is active:

    ui_activated? :my_key # will return true if :my_key is in the active state
    ui_activated :my_key # ui_activated? is aliased to ui_activated if you so prefer

Find if multiple keys are active:

    ui_activated? :my_key, :another_key # will return true if all of the arguments are in the active state

Get a html active class value:

    <li class='<%= activated_class :my_key %>'>My Item</li> <!-- will produce class='active' if :my_key is in the active state otherwise class='' -->

By default the returned class is 'active', but you can change this:

    self.class.activated_class 'my_active_class'
    activated_class :key # will now return 'my_active_class'

## With Rails

ActivatedUI isn't dependant on Rails but if you are using it with Rails here's how:

    class ApplicationController < ActionController::Base
      include ActivatedUI
    end

    class PostsController < ApplicationController

      activate_ui_marked :posts # Adds :key to the active state using a call to before_filter
      activate_ui_marked :posts, :only => [:show] # It will pass on any options, so you can use before_filter's :only and :except options

      activated_class 'my_custom_active_class' # Change the return value of activated_class :key

      def show
        activate_ui_marked :show
        # show.html.erb
      end

    end


Activated UI will add activated\_class, activate\_ui\_marked, stored\_activated_ui, ui\_activated? and ui\_activated as view helpers:

    <% if ui_activated? :posts %>
      <ul>
         <li class='<%= activated_class :show %>'><%= activated_link_to :show, "Show Posts", post_path(@post), class: 'btn' %></li>
      </ul>
    <% end %>

It will also add a helper to wrap Rail's `link_to`:

    <%= activated_link_to :show, "Show Posts", post_path(@post), class: 'btn' %>

It behaves the same way as `link_to` except there is an additional first argument that takes either a single key or an array of keys to check the active state with using `ui_activated?`. The active class is added to any classes you pass into via the options argument.





[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/msaspence/activated_ui/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

