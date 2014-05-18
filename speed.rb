require 'benchmark'
require 'httpi'
require 'httpclient'
require 'curb'
require 'em-synchrony'
require 'em-http-request'
require 'net/http/persistent'
require 'excon'
require 'rack'
HTTPI.log = false
def get(url, adapter)
  case adapter
    when :client
      HTTPI.adapter = :httpclient
      str = HTTPI.get(url)
    when :curb
      HTTPI.adapter = :curb
      str = HTTPI.get(url)
    when :em
      HTTPI.adapter = :em_http
      str = HTTPI.get(url)
    when :net
      HTTPI.adapter = :net_http
      str = HTTPI.get(url)
    when :pers
      HTTPI.adapter = :net_http_persistent
      str = HTTPI.get(url)
    when :ex
      HTTPI.adapter = :excon
      str = HTTPI.get(url)
    when :rack
      HTTPI.adapter = :rack
      str = HTTPI.get(url)
  end
  str
end

def post(str, body, adapter)
  url = nil
  case adapter
    when :client
      HTTPI.adapter = :httpclient
      str = HTTPI.post(url, body)
    when :curb
      HTTPI.adapter = :curb
      str = HTTPI.post(url, body)
    when :em
      HTTPI.adapter = :em_http
      str = HTTPI.post(url, body)
    when :net
      HTTPI.adapter = :net_http
      str = HTTPI.post(url, body)
    when :pers
      HTTPI.adapter = :net_http_persistent
      str = HTTPI.post(url, body)
    when :ex
      HTTPI.adapter = :excon
      str = HTTPI.post(url, body)
    when :rack
      HTTPI.adapter = :rack
      str = HTTPI.post(url, body)
  end
  url
end

def put(url, adapter)
  case adapter
    when :client
      HTTPI.adapter = :httpclient
      str = HTTPI.put(url)
    when :curb
      HTTPI.adapter = :curb
      str = HTTPI.put(url)
    when :em
      HTTPI.adapter = :em_http
      str = HTTPI.put(url)
    when :net
      HTTPI.adapter = :net_http
      str = HTTPI.put(url)
    when :pers
      HTTPI.adapter = :net_http_persistent
      str = HTTPI.put(url)
    when :ex
      HTTPI.adapter = :excon
      str = HTTPI.put(url)
    when :rack
      HTTPI.adapter = :rack
      str = HTTPI.put(url)
  end
  str
end

def head(url, adapter)
  case adapter
    when :client
      HTTPI.adapter = :httpclient
      str = HTTPI.head(url)
    when :curb
      HTTPI.adapter = :curb
      str = HTTPI.head(url)
    when :em
      HTTPI.adapter = :em_http
      str = HTTPI.head(url)
    when :net
      HTTPI.adapter = :net_http
      str = HTTPI.head(url)
    when :pers
      HTTPI.adapter = :net_http_persistent
      str = HTTPI.head(url)
    when :ex
      HTTPI.adapter = :excon
      str = HTTPI.head(url)
    when :rack
      HTTPI.adapter = :rack
      str = HTTPI.head(url)
  end
  str
end

def delete(url, adapter)
  case adapter
    when :client
      HTTPI.adapter = :httpclient
      str = HTTPI.delete(url)
    when :curb
      HTTPI.adapter = :curb
      str = HTTPI.delete(url)
    when :em
      HTTPI.adapter = :em_http
      str = HTTPI.delete(url)
    when :net
      HTTPI.adapter = :net_http
      str = HTTPI.delete(url)
    when :pers
      HTTPI.adapter = :net_http_persistent
      str = HTTPI.delete(url)
    when :ex
      HTTPI.adapter = :excon
      str = HTTPI.delete(url)
    when :rack
      HTTPI.adapter = :rack
      str = HTTPI.delete(url)
  end
  str
end

SAMPLES = 25
root = 'http://httpbin.org'
body = 'The quick brown fox jumped over the lazy dog.'
Benchmark.bm do |r|
  obj = "#{root}/get"
  r.report('httpclient-get') do
    SAMPLES.times do
      get(obj, :client)
    end
  end
  r.report('curb-get') do
    SAMPLES.times do
      get(obj, :curb)
    end
  end
  r.report('em-http-request-get') do
    SAMPLES.times do
      get(obj, :em_http)
    end
  end
  r.report('net-http-get') do
    SAMPLES.times do
      get(obj, :net)
    end
  end
  r.report('net-http-persistent-get') do
    SAMPLES.times do
      get(obj, :pers)
    end
  end
  r.report('excon-get') do
    SAMPLES.times do
      get(obj, :ex)
    end
  end
end
Benchmark.bm do |r|
  obj = "#{root}/put"
  r.report('httpclient-put') do
    SAMPLES.times do
      put(obj, :client)
    end
  end
  r.report('curb-put') do
    SAMPLES.times do
      put(obj, :curb)
    end
  end
  r.report('em-http-request-put') do
    SAMPLES.times do
      put(obj, :em_http)
    end
  end
  r.report('net-http-put') do
    SAMPLES.times do
      put(obj, :net)
    end
  end
  r.report('net-http-persistent-put') do
    SAMPLES.times do
      put(obj, :pers)
    end
  end
  r.report('excon-put') do
    SAMPLES.times do
      put(obj, :ex)
    end
  end
end
Benchmark.bm do |r|
  obj = "#{root}/delete"
  r.report('httpclient-delete') do
    SAMPLES.times do
      delete(obj, :client)
    end
  end
  r.report('curb-delete') do
    SAMPLES.times do
      delete(obj, :curb)
    end
  end
  r.report('em-http-request-delete') do
    SAMPLES.times do
      delete(obj, :em_http)
    end
  end
  r.report('net-http-delete') do
    SAMPLES.times do
      delete(obj, :net)
    end
  end
  r.report('net-http-persistent-delete') do
    SAMPLES.times do
      delete(obj, :pers)
    end
  end
  r.report('excon-delete') do
    SAMPLES.times do
      delete(obj, :ex)
    end
  end
end
Benchmark.bm do |r|
  obj = "#{root}/headers"
  r.report('httpclient-head') do
    SAMPLES.times do
      head(obj, :client)
    end
  end
  r.report('curb-head') do
    SAMPLES.times do
      head(obj, :curb)
    end
  end
  r.report('em-http-request-head') do
    SAMPLES.times do
      head(obj, :em_http)
    end
  end
  r.report('net-http-head') do
    SAMPLES.times do
      head(obj, :net)
    end
  end
  r.report('net-http-persistent-head') do
    SAMPLES.times do
      head(obj, :pers)
    end
  end
  r.report('excon-head') do
    SAMPLES.times do
      head(obj, :ex)
    end
  end
end
