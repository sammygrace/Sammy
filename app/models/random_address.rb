class RandomAddress

  def random
    self.class.addresses.sample
  end

  def self.populate(times = 10)
    addresses = []
    (times / 9).times do |index|
      raw = `curl https://www.bestrandoms.com/random-address`
      doc = Nokogiri::HTML(raw)
      extract_addresses(doc).each do |address|
        addresses << address.join(" ")
      end
    end
    IO.write "db/addresses.txt", addresses.join("\n")
  end

  def self.extract_addresses(doc)
    doc.css("ul.content li").map do |li|
      li.css("span")[1..-1].map(&:text)
    end
  end

  def self.addresses
    @@addresses ||= IO.read("db/addresses.txt").split("\n")
  end
end
