local_session
====

프로세스 실행과 실행 간에 로컬 변수를 유지하도록 해줍니다. 실행되고 바로 끝나는 cron 태스크를 작성할 때 유용합니다.

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

설치
----
```
gem install local_session
```

주의
----
* 코드에 파일 잠금/동시성 처리에 대한 루틴이 작성되어 있지 않습니다. 동시에 동일 경로에 local_session을 사용하는 루비 프로그램이 두개 이상 실행되면 런타임 에러를 야기할 수 있습니다.

ㅎㅇ
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