require 'nokogiri'

doc = Nokogiri::HTML(File.open("stddev.html"))
article_node = doc.xpath("//article")

@stats = []

def find_in_level(nodes, n)
  @stats[n-1] ||= 0
  @stats[n-1] += nodes.children.select{|n| n.name == 'p'}.count
  nodes.children.each do |node|
    find_in_level(node, n+1)
  end
end

find_in_level(article_node, 1)

population = []
@stats.each_with_index do |item, idx|
  item.times { population << idx + 1 }
end

pop_count = population.length.to_f

mean = population.inject(0,:+) / pop_count

puts Math.sqrt(population.map{|i| (i - mean)**2 }.inject(0,:+) / pop_count)
