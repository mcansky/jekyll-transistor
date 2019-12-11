#  Transistor embed tag for Jekyll/Liquid
#
#  Usage: 
#  
#    {% transistor_sound 8eea9221 %}
#    {% soundcloud_sound 8eea9221 light %}
#    {% soundcloud_sound 8eea9221 dark %}
#
#    ... where 8eea9221 is the SoundCloud sound ID, light/dark is the color.
#    
#    * Requires a paid Transistor account
#
#  Author: Thomas Riboulet (@mcansky)
#  Source: https://github.com/mcansky/jekyll-transistor

require 'shellwords'

module Jekyll
  class TransistorSoundTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      params = Shellwords.shellwords markup
      @sound = { :id => params[0], :color => params[1] || "light" }
    end

    def render(context)
      url = "https://share.transistor.fm/e/#{@sound[:id]}"
      url += "/dark" if @sound[:color] == 'dark'
      "<iframe src='#{url}' width='100%' height='180' frameborder='0' scrolling='no' seamless='true' style='width:100%; height:180px;'></iframe>"
    end

  end

end

Liquid::Template.register_tag('transistor_sound', Jekyll::TransistorSoundTag)
