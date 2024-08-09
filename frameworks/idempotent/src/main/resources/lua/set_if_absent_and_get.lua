-- 原子性获取给定key，若key存在返回其值，若key不存在则设置key并返回null
local key = KEYS[1]
local value = ARGV[1]
local expire_time_ms = ARGV[2]

return redis.call('SET', key, value, 'NX', 'GET', 'PX', expire_time_ms)
