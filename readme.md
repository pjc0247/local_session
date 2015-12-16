local_session
====

���μ��� ����� ���� ���� ���� ������ �����ϵ��� ���ݴϴ�. ����ǰ� �ٷ� ������ cron �½�ũ�� �ۼ��� �� �����մϴ�.

__test.rb__
```rb
require 'local_session'

count ||= 0

puts "count : #{count}"

count += 1
```
```
ruby test.rb
count : 0
ruby test.rb
count : 1
ruby test.rb
count : 2
```

��ġ
----
```
gem install local_session
```

����
----
* �ڵ忡 ���� ���/���ü� ó���� ���� ��ƾ�� �ۼ��Ǿ� ���� �ʽ��ϴ�. ���ÿ� ���� ��ο� local_session�� ����ϴ� ��� ���α׷��� �ΰ� �̻� ����Ǹ� ��Ÿ�� ������ �߱��� �� �ֽ��ϴ�.

����
----
```rb
require 'local_session'

last_id ||= fetch_events.first["id"];

fetch_events.each do |event|
  break if event["id"] == last_id
  
  /* process */
  
  last_id = event["id"]
end
```