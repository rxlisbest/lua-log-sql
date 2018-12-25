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
local sql = string.format( "INSERT INTO access_log (content, create_time) VALUES ('%s', %s)", 123, os.time())
local res, err, errno, sqlstate = db:query(sql)
db:close()
-- ngx.say(#res)
if not res then
    ngx.say(err)
    return
end
