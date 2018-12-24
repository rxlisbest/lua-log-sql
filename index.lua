package.path = ngx.var.lua_log_sql_dir .. "?.lua;;"
local mysql = require "lib.resty.mysql"
local db_config = require "config.db"

local db, err = mysql:new()
if not db then
    return
end
local ok, err, errcode, sqlstate = db:connect(db_config)
if not ok then
    ngx.say(err)
    return
end
