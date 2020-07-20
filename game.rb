require_relative 'global/world'
require_relative 'global/player'

$text = {hello_text: {
  text1: 'Вы пробуждаетесь во тьме .... вокруг ничего нет ... лишь тьма .... вы не видите совсем ничего ',
  text2: '.... даже своих рук ... Вы даже ничего не чувствуете ....',
  text3: 'И вдруг ... у себя в голове вы слышите чей-то голос ... как-бы телепатически говорящий с вами ',
  text4: '... он не похож ни на чей голос, который Вы слышали когда-лиюо .... Это Ваш голос ... ',
  text5: 'или по крайней мере похож на ваш внутренний голос',
  text6: 'Он говорит Вам что вам дан шанс начать все заново и стать тем, кем вы хотите ... переродившись',
  text7: 'в другом мире ...',
  text8: 'Вы согласны: ? ...'},
         user_choose: {
           default_text: "Нажмите '1' - если 'Да' и '2' - если 'Нет': ....  ",
           input_1: 'Да',
           input_2: 'Нет',
           input_3: 'Вы сделали не правильный выбор, повторите свой выбор ...'
         }
}

class Game < World




  def intro(text)
    $text[:hello_text].each {|text_key, value| puts value; sleep 2}
    print $text[:user_choose][:default_text]
    user_choose(gets.chomp.to_i)
    p "И кстати, в этом мире боги играют в кости ..."
  end

  def no_choose(text)
    while true
      if $u_choose == 1
        puts "Вы избрали ответ: #{text[:user_choose][:input_1]}"
        puts
        break
      elsif $u_choose == 2
        puts "Вы избрали ответ: #{text[:user_choose][:input_2]}, но Вы должны понимать, что выбора у Вас - Нет ..... <зловещий смех>"
        puts
        break
      else
        puts text[:user_choose][:input_3]
        puts
        user_choose(gets.chomp.to_i)
      end
    end
  end

end
############### Game Structure ###############
@game = Game.new

#Intro
# @game.intro(@text)
@game.no_choose($text)

#Create Character
$player = Player.new

$player.$main_stats

$player.create_character_stats
sleep 2

$player.create_character_race
sleep 2

display_player_main_stats



