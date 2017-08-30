Instructions
------------

* [Install logstash](https://www.elastic.co/guide/en/logstash/current/installing-logstash.html)
* [Install go 1.8+](https://golang.org/doc/install)
* [Install logstash-filter-verifier](https://github.com/magnusbaeck/logstash-filter-verifier)
* Install cloudwatch input plugin:
  ```
  sudo -u logstash /usr/share/logstash/bin/logstash-plugin install logstash-input-cloudwatch
  sudo -u logstash /usr/share/logstash/bin/logstash-plugin install logstash-codec-cloudtrail
  ```

```
cd roles/logstash/tests
./test.sh
```

For additional verbosity you can run
```
./test.sh --logstash-output --loglevel DEBUG
```

Troubleshooting
---------------

* `fork/exec /opt/logstash/bin/logstash: no such file or directory` -
Find where installing logstash has put the binary and add that to test.sh

* `An unexpected error occurred! {:error=>#<ArgumentError: Path "/usr/share/logstash/data" must be a writable directory. It is not writable.>` -
Add your user to the logstash group using `gpasswd -a $USER logstash`. Also, set more generous permissions using `sudo chmod -R g+w /usr/share/logstash`.
You might need to run `newgrp logstash` to obtain the permissions without restarting your login.
