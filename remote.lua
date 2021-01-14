local script = libs.script;


-- Documentation
-- http://www.unifiedremote.com/api

-- Script Library
-- http://www.unifiedremote.com/api/libs/script


--@help launch_chrome
actions.launchchrome = function ()
	os.start("google-chrome");
end


--@help yttv
actions.yttv = function ()
	script.default("google-chrome https://youtube.com/tv");
end
