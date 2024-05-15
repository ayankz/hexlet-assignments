# frozen_string_literal: true
# BEGIN
require 'forwardable'
require 'uri'
class Url
  attr_accessor :url

  extend Forwardable

  def initialize(url)
    @url = url
    @attributed_url = Attribute.new(url)
  end

  def query_params
    result = {}
    params = url.split('?')[1]
    params&.split('&')&.each do |p|
      key, value = p.split('=')
      result[key.to_sym] = value
    end
    result
  end

  def query_param(key, default = nil)
    self.query_params[key] || default
  end

  def ==(other)
    self.url == other.url
  end

  def_delegators   :@attributed_url, :scheme, :host

  class Attribute
    attr_accessor :url

    def initialize(url)
      @url = url
    end

    def scheme
      url.split('://').first
    end
    def host
      url.split('://').last.split('?').first.split(':').first
    end
  end
end

# END
yandex_url = Url.new 'http://yandex.ru?key=value&key2=value2'
yandex_url_same = Url.new 'http://yandex.ru?key2=value2&key=value'
result = yandex_url == yandex_url_same
puts result