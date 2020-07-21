require 'yaml'

module Global

  TEXT = YAML.load_file('global/text.yml')

  def player_yes_no_choose_text
    TEXT['user_choose']['output'].each { |key, value| puts value}
    puts
  end


  def player_yes_no_choose_input(*args)
    tmp = args[0]
    # p tmp
    input = gets.to_i
    if input == 1
      puts "Вы избрали ответ: #{TEXT['user_choose']['input']['input_1']}"
      puts
    elsif input == 2 && tmp.nil?
      puts "Вы избрали ответ: #{TEXT['user_choose']['input']['input_2']}"
      puts
      # get special param ('no_choose') in method (*args)
    elsif input == 2 && !tmp.nil? || input == 2 && args[0] == 'no_choose' || input == 2 && tmp[0] == 'no_choose'
      puts "Вы избрали ответ: #{TEXT['user_choose']['input']['input_2']}, но Вы должны понимать, что выбора у Вас - НЕТ!"
      puts
    else
      puts "#{TEXT['user_choose']['input']['input_3']}"
      player_yes_no_choose_input(tmp)
    end
  end



end