package.path = ngx.var.lua_dir .. "?.lua;;"
local mysql = require "lib.resty.mysql"
local db, err = mysql:new()
if not db then
    return
end
local ok, err, errcode, sqlstate = db:connect(mysql_config)
if not ok then
    return
end
