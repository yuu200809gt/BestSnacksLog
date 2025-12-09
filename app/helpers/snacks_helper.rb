module SnacksHelper
  def wrap_text(text,length = 39)
    text.scan(/.{1,#{length}}/).join("<br>").html_safe
  end
end
