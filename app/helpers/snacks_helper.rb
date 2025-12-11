module SnacksHelper
  def wrap_text(text,length = 10)
    text.scan(/.{1,#{length}}/).join("<br>").html_safe
  end
end
