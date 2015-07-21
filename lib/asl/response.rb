require 'nokogiri' unless defined?(Nokogiri)

module ASL
  class Response
    def initialize(response)
      @_response = response
    end

    def to_html
      @html ||= Nokogiri::HTML( _response.body )
    end

    def css(*args)
      to_html.css(*args)
    end

    def xpath(*args)
      to_html.xpath(*args)
    end

    def method_missing(m, *args, &blk)
      _response.respond_to?(m) ? _response.send(m, *args, &blk) : super
    end

    def respond_to_missing(include_private = false)
      _response.respond_to?(m)
    end

    private

    attr_reader :_response
  end
end
