local timer = libs.timer;
local server = libs.server;

local tid = -1;
local title = "";

events.focus = function ()
	title = "";
	tid = timer.interval(actions.update, 500);
end

events.blur = function ()
	timer.cancel(tid);
end

--@help Update status information
actions.update = function ()
	local _active = "";
	local _title = "[Inactive]";

	_active = os.script("dbus-send --print-reply --dest=org.freedesktop.DBus  /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep nodejs.dbus.YoutubeTV");

	if (_active == "") then
		_title = "[Inactive]";
	else
		_title = "[Active]"
	end

	if (_title ~= title) then
		title = _title;
		server.update({ id = "info", text = title });
	end
end

--@help launch
actions.launch = function ()
	os.start("youtube-tv");
end

--@help close
actions.close = function ()
	os.script("pkill -9 youtube-tv");
end
