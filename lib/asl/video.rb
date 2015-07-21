module ASL
  class Video

    XPATH = %Q{//*[@id="player1Video"]/source}

    def self.parse(response)
      response.xpath(XPATH).flat_map {|node|
        node.attributes['src']
      }.reject(&:nil?).map do |node|
        new(path: node.value)
      end
    end

    def initialize(path: nil)
      @path = path
    end

    def url
      "https://www.signingsavvy.com/#{path}"
    end

    private

    attr_reader :path

  end
end
