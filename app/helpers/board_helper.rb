module BoardHelper

  def create_board()
    board_html = ""
    is_white_space = true
    data = '<td class="%s" id="%s"/>'

    8.downto(1).each do |second|
      board_html << "<tr>"
      ('a'..'h').each do |first|
        class_name = "black_space"
        if is_white_space
          class_name = "white_space"
        end
        is_white_space = !is_white_space

        board_html << data % [class_name ,first + second.to_s]
      end
      is_white_space = !is_white_space
      board_html << "</tr>"
    end


    return board_html.html_safe
  end

end
