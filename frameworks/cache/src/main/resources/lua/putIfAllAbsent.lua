--[[KEYS 全部不存在，创建并返回 true，反之返回空]]

for i, v in ipairs(KEYS) do
    if (redis.call('exists', v) == 1) then
        return nil;
    end
end
for i, v in ipairs(KEYS) do
    redis.call('set', v, 'default');
    redis.call('pexpire', v, ARGV[1]);
end
return true;
