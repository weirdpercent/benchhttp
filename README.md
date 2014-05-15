benchhttp
=========

**DISCLAIMER:** Benchmarks are not always reliable, the numbers vary, and many factors must be taken into account. I am new to benchmarking. If you are the maintainer of one of these projects and you disagree with my conclusions, please tell me why and I will gladly correct this documentation. I know developers often put a lot into testing and optimizing their code. I put these benchmarks together for my own education. If you are trying to decide which library to use, don't just take these numbers at face value, run your own tests. Each system is different.

       user     system      total        real
    0.040000   0.030000   0.070000 (  4.284638) - httpclient-get
    0.020000   0.050000   0.070000 (  3.773601) - curb-get
    0.000000   0.000000   0.000000 (  0.000011) - em-http-request-get
    0.030000   0.020000   0.050000 (  3.638270) - net-http-get
    0.030000   0.010000   0.040000 (  2.299586) - net-http-persistent-get
    0.020000   0.050000   0.070000 (  3.721378) - excon-get

       user     system      total        real
    0.020000   0.040000   0.060000 (  3.563785) - httpclient-put
    0.020000   0.050000   0.070000 (  3.567248) - curb-put
    0.000000   0.000000   0.000000 (  0.000011) - em-http-request-put
    0.020000   0.020000   0.040000 (  3.298050) - net-http-put
    0.010000   0.020000   0.030000 (  1.689202) - net-http-persistent-put
    0.040000   0.030000   0.070000 (  3.830862) - excon-put

       user     system      total        real
    0.030000   0.040000   0.070000 (  5.234095) - httpclient-delete
    0.050000   0.070000   0.120000 (  8.610902) - curb-delete
    0.000000   0.000000   0.000000 (  0.000015) - em-http-request-delete
    0.000000   0.050000   0.050000 (  4.261476) - net-http-delete
    0.010000   0.020000   0.030000 (  5.170107) - net-http-persistent-delete
    0.040000   0.040000   0.080000 (  3.610086) - excon-delete

       user     system      total        real
    0.010000   0.040000   0.050000 (  5.312374) - httpclient-head
    0.030000   0.060000   0.090000 (  5.211903) - curb-head
    0.000000   0.000000   0.000000 (  0.000010) - em-http-request-head
    0.000000   0.050000   0.050000 (  4.642372) - net-http-head
    0.000000   0.030000   0.030000 (  2.429609) - net-http-persistent-head
    0.040000   0.040000   0.080000 (  3.937494) - excon-head


**SUBJECTIVE INTERPRETATION:** I read alot about various ruby http client libraries [here](http://www.slideshare.net/HiroshiNakamura/rubyhttp-clients-comparison) and [here](http://bit.ly/RubyHTTPClients2012). Granted, these links are 2 years old, and these libraries have changed since then, but still, I learned alot. The [httpi](http://httpirb.com) gem provides an interface to several common HTTP clients. These benchmarks are run using httpi to select the adapter. net-http-persistent seems to be the fastest without resorting to using EventMachine.
