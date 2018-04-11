Instructions
------------

- Run the full complete tests.

Make sure you have docker running and having internet access. Also ansible is required.


```
cd tests
./test-all.sh
```

To add new test cases have a look at filter_test_docker.yml and http_test_docker.yml to see how to create a new input json file - See example 'elb1.json' as an example.

It will test:

- The logstash role to be sure it can deploy to a remote host
- Using that logstash to test the filters with input matching '*.json' in the 'tests' folder.

Any changes in the role requires a pass run otherwise it would be a regression.


The section below is old information. It would be removed one day.

## Old intruction

This is intructions before the docker test target is implemented. If you run
the 'test.sh' or 'test.yml' you follow this intructions. Not sure how updated
it is atm as I do not want to install logstash and go etc in my desktop so I
did not test it.

Also the logstash used to test is not exactly the one gets installed using the
role so the role is not tested. It only tests the filters.

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
