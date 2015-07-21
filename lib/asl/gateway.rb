require "httparty" unless defined?(HTTParty)

module ASL
  class Gateway
    include HTTParty

    base_uri "signingsavvy.com"

    def self.search(term)
      Video.parse(
        Response.new(
          get("/sign/#{CGI.escape(term.to_s.upcase)}")
        )
      )
    end

    def self.find(term, id, variation)
      Video.parse(
        Response.new(
          get("/sign/#{CGI.escape(term.to_s.upcase)}/#{id}/#{variation}")
        )
      )
    end
  end
end
