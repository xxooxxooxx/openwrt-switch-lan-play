-- Copyright 2008 Steven Barth <steven@midlink.org>
-- Copyright 2008 Jo-Philipp Wich <jow@openwrt.org>
-- Licensed to the public under the Apache License 2.0.

module("luci.controller.switchlanplay", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/switchlanplay") then
		return
	end

	entry({"admin", "services", "switchlanplay"}, cbi("switchlanplay"), _("Switch-Lan-Play")).dependent = true
	
	entry({"admin", "services", "switchlanplay", "servers"}, cbi("servers"), _("Servers Manage"), 20).leaf = true
end
