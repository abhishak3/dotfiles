--[[
     Blackburn Awesome WM theme 3.0
     github.com/lcpz
--]]

local gears   = require("gears")
local lain    = require("lain")
local awful   = require("awful")
local wibox   = require("wibox")
local vicious = require("vicious")
local dpi     = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/blackburn"
theme.wallpaper                                 = "/home/shaker/Pictures/dracula/astronaut.png"
theme.font                                      = "CaskaydiaCove Nerd Font 11"
theme.taglist_font                              = "JetBrains Mono 11"
theme.fg_normal                                 = "#D7D7D7"
theme.fg_focus                                  = "#FF6859"
theme.bg_normal                                 = "#00010D"
theme.bg_focus                                  = "#112827"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#2A1F1E"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#0E0E0E"
theme.border_focus                              = "#fc8281"
theme.taglist_fg_focus                          = "#fc8281"
theme.taglist_bg_focus                          = "#282828"
theme.tasklist_fg_focus                         = "#F6784F"
theme.tasklist_bg_focus                         = "#060606"
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
-- theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
-- theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = 10
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_minimize_button_focus            = theme.dir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_minimize_button_normal           = theme.dir .. "/icons/titlebar/minimize_normal.png"
theme.corner_radius                             = 10
theme.opacity                                   = "00"
theme.battery_widget                            = "#006692" .. theme.opacity
theme.wifi_widget                               = "#04BFAD" .. theme.opacity
theme.volume_bg                                 = "#F25050" .. theme.opacity
theme.clock_bg                                  = "#8C3030" .. theme.opacity
theme.battery_critical                          = "#FF7064"
theme.battery_charging                          = "#FDD69D"
theme.battery_normal                            = "#04D9B2"
theme.wifi_widget_text                          = "#038C7F"
theme.volume_text                               = "#F25050"
theme.clock_text                                = "#EFF2EB"
theme.logo_bg                                   = theme.bg_focus

awful.util.tagnames = { " ", " ", " ", " ", " " }

local markup     = lain.util.markup
local separators = lain.util.separators
local gray       = "#9E9C9A"

-- adds left separator to widgets
function separator_left(bgcolor, fgcolor)
  return wibox.widget {
    {
      markup = "<span font_desc='18'></span>",
      widget = wibox.widget.textbox,
    },
    bg = bgcolor,
    fg = fgcolor,
    widget = wibox.container.background
  }
end

-- adds right separator to widgets
function separator_right(bgcolor, fgcolor)
  return wibox.widget {
    {
      markup = "<span font_desc='18'></span>",
      widget = wibox.widget.textbox,
    },
    bg = bgcolor,
    fg = fgcolor,
    widget = wibox.container.background
  }
end

-- adds bottom margin to widgets
function bottom_margin(widget, margin_color)
  return wibox.widget {
    widget,
    bottom = 2,
    color = margin_color,
    widget = wibox.container.margin
  }
end

-- Textclock
local clock_arrow_left = separator_left(theme.volume_bg, theme.clock_bg)
local mytextclock = wibox.widget {
  {
    format = "<span foreground='" .. theme.clock_text .. "' font='Monoid Bold 10'> %H:%M </span>",
    widget = wibox.widget.textclock,
  },
  bg = theme.clock_bg,
  widget = wibox.container.background
}
mytextclock = bottom_margin(mytextclock, theme.clock_text)

-- Calendar
theme.cal = lain.widget.cal({
  attach_to = { mytextclock },
  notification_preset = {
    font = "Fira Code 11",
    fg   = theme.fg_normal,
    bg   = theme.bg_normal
  }
})
local month_calendar = awful.widget.calendar_popup.month({
  opacity = 0.8,
  bg = "#000",
  style_focus = {
    bg_color = theme.fg_focus,
    fg_color = theme.bg_normal
  }
})
month_calendar:attach(mytextclock, "tr")

-- Battery
local bat = lain.widget.bat({
  settings = function()
    bat_header = " Bat "
    bat_p      = bat_now.perc .. "%"
    widget:set_markup(markup.font(theme.font, markup(gray, bat_header) .. bat_p))
  end
})

-- ALSA volume
theme.volume = lain.widget.alsa({
  settings = function()
    header = " "
    vlevel = volume_now.level

    if volume_now.status == "off" then
      vlevel = " " .. vlevel .. " "
    else
      vlevel = " " .. vlevel .. " "
    end
    widget:set_markup(markup.font(theme.font, markup(gray, header) .. markup(theme.volume_text, vlevel)))
  end
})
local volume_widget = wibox.container.background(theme.volume.widget, theme.volume_bg);
volume_widget = bottom_margin(volume_widget, theme.volume_text)

-- Separators
local first = wibox.widget.textbox('<span font="FiraCode Nerd Font 10"> </span>')

-- Arch Logo
local try_arch = wibox.widget {
  {
    {
      markup = "<span foreground='" .. theme.bg_normal .. "' font='Font Awesome 6 Free 15'>   </span>",
      -- forced_width = 28,
      widget = wibox.widget.textbox
    },
    bg = theme.logo_bg,
    widget = wibox.container.background
  },
  -- separator_right(barcolor, theme.fg_focus),
  layout = wibox.layout.fixed.horizontal
}

local barcolor    = theme.bg_normal .. theme.opacity
local barheight   = dpi(18)
theme.titlebar_bg = barcolor

theme.titlebar_bg_focus = gears.color({
  type  = "linear",
  from  = { barheight, 0 },
  to    = { barheight, barheight },
  stops = { { 0, theme.bg_normal }, { 0.5, theme.border_normal }, { 1, "#321749" } }
})

function theme.at_screen_connect(s)
  -- Quake application
  s.quake = lain.util.quake({ app = awful.util.terminal })

  -- If wallpaper is a function, call it with the screen
  local wallpaper = theme.wallpaper
  if type(wallpaper) == "function" then
    wallpaper = wallpaper(s)
  end
  gears.wallpaper.maximized(wallpaper, s, true)

  -- Tags
  awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contains an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(my_table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 2, function() awful.layout.set(awful.layout.layouts[1]) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)))

  -- Create a taglist widget

  s.mytaglist = awful.widget.taglist {
    screen          = s,
    filter          = awful.widget.taglist.filter.all,
    style           = {
      fg_focus = theme.bg_focus,
      bg_focus = theme.fg_focus,
      font = "Font Awesome 6 Free",
    },
    widget_template = {
      {
        {
          {
            id     = 'text_role',
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        left   = 15,
        right  = 10,
        widget = wibox.container.margin
      },
      shape  = gears.shape.powerline,
      id     = 'background_role',
      widget = wibox.container.background
    }
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen          = s,
    filter          = awful.widget.tasklist.filter.currenttags,
    buttons         = awful.util.tasklist_buttons,
    style           = {
      bg_focus           = theme.bg_focus .. theme.opacity,
      bg_normal          = theme.bg_normal .. theme.opacity,
      fg_focus           = theme.fg_focus,
      fg_normal          = theme.fg_normal,
      shape_border_width = 1,
      shape_border_color = theme.border_focus,
      shape              = gears.shape.rounded_bar,
    },
    layout          = {
      spacing        = 20,
      spacing_widget = {
        {
          forced_width = 5,
          shape        = gears.shape.circle,
          widget       = wibox.widget.separator
        },
        valign = 'center',
        halign = 'center',
        widget = wibox.container.place,
      },
      layout         = wibox.layout.flex.horizontal
    },
    widget_template = {
      {
        {
          {
            {
              id     = 'icon_role',
              widget = wibox.widget.imagebox,
            },
            margins = 2,
            widget  = wibox.container.margin,
          },
          {
            id     = 'text_role',
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        left   = 10,
        right  = 10,
        widget = wibox.container.margin
      },
      id     = 'background_role',
      widget = wibox.container.background,
    },
  }

  -- Create the wibox
  s.mywibox = awful.wibar({
    position = "top",
    screen = s,
    height = dpi(25),
    bg = barcolor .. theme.opacity;
  })

  -- powerline arrow widget
  local wifi_arrow_left = separator_left(barcolor, theme.wifi_widget)
  local battery_arrow_left = separator_left(theme.wifi_widget, theme.battery_widget)
  local sound_arrow_left = separator_left(theme.battery_widget, theme.volume_bg)

  -- Wifi Widget
  local wifi_text = wibox.widget.textbox()
  local wifi_widget = wibox.container.background(wifi_text, theme.wifi_widget)
  wifi_widget = bottom_margin(wifi_widget, theme.wifi_widget_text)

  vicious.register(
    wifi_text,
    vicious.widgets.wifi,
    '<span color="' .. theme.wifi_widget_text .. '">  ${ssid} ${linp}% </span>',
    2,
    "wlo1"
  )

  -- Battery Widget
  local batterytext = wibox.widget.textbox()
  local batterywidget = wibox.container.background(batterytext, theme.battery_widget)
  batterywidget = bottom_margin(batterywidget, theme.battery_widget)
  vicious.register(
    batterywidget,
    vicious.widgets.bat,
    function(widget, args)
      if args[1] == '+' then
        theme.battery_widget = theme.battery_charging
        batterytext:set_markup(string.format('<span color="%s">   %s%% </span>', theme.battery_charging, args[2]))
      elseif args[2] <= 25 then
        theme.battery_widget = theme.battery_critical
        batterytext:set_markup(string.format('<span color="%s">   %s%% </span>', theme.battery_critical, args[2]))
      else
        theme.battery_widget = theme.battery_normal
        batterytext:set_markup(string.format('<span color="%s">   %s%% </span>', theme.battery_normal, args[2]))
      end
      batterywidget.color = theme.battery_widget
      battery_arrow_left.fg = theme.battery_widget
      sound_arrow_left.bg = theme.battery_widget
    end,
    1,
    "BAT0"
  )

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    -- Left Widgets
    {
      -- try_arch,
      -- first,
      s.mytaglist,
      first,
      s.mylayoutbox,
      first,
      s.mypromptbox,
      first,
      layout = wibox.layout.fixed.horizontal,
    },

    -- Center Widgets
    s.mytasklist,

    -- Right Widgets
    {
      first,
      wibox.widget.systray(),
      first,
      -- wifi_arrow_left,
      wifi_widget,
      -- battery_arrow_left,
      batterywidget,
      -- sound_arrow_left,
      volume_widget,
      -- clock_arrow_left,
      mytextclock,
      layout = wibox.layout.fixed.horizontal,
    },
  }
end

return theme
