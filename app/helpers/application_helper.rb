#coding: utf-8
module ApplicationHelper



  def glyph(*names)
   content_tag :i, nil, class: names.map{|name| "#{name.to_s.gsub('_','-')}" }
  end

	
  def readable_date(d)
	if d
		return d.getlocal.strftime("%d.%m.%Y").to_s+" в "+d.getlocal.strftime("%H:%M").to_s
	end
	return "Нет информации"
  end

def render_title
  return @title if defined?(@title)
  "страница"
end

end
