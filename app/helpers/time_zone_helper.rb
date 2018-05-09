module TimeZoneHelper

  def time_zone_select_dst object, method, priority_zones = nil, options = {}, html_options = {}
    if Time.zone.now.dst?
      new_select = time_zone_select(object, method, priority_zones, options, html_options).to_s
      res = []
      time_zone_select(object, method, priority_zones, options, html_options).scan(/([+-]\d+)/) do |c|
        res << [c, $~.offset(0)[0]]
      end
      res.each do |match|
        new_select[match[1], 3] = format_match match[0][0].to_i + 1
      end
      new_select
    else
      time_zone_select object, method, priority_zones, options, html_options
    end
  end

  private

  def format_match int
    if int > -1 && int < 10
      "+0" + int.to_s
    elsif int > 9
      "+" + int.to_s
    elsif int < 0 && int > -10
      "-0" + int.to_s.slice(1, 5)
    else
      int.to_s
    end
  end

end
