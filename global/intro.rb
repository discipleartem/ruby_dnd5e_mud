require 'yaml'

module Intro

TEXT = YAML.load_file('global/text.yml')

  def intro
    TEXT['intro_text']['hello_text'].each {|text_key, value| puts value; sleep 2}
  end


end
