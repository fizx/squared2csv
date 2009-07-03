require "rubygems"
require 'nokogiri'
require 'faster_csv'

def doc2csv(doc)
  FasterCSV.generate do |csv|
    headers = ["Item Name"]
    headers += (doc / ".squared-attribute-header td").map {|a| a.inner_text }
    headers.pop
    csv << headers
    item_names = (doc / ".squared-item-table tr").map {|a|a.inner_text}
    item_names.pop
    rows = (doc / ".squared-value-table tr")
    rows.pop
    
    item_names.zip(rows) do |name, row|
      entries = row / "td"
      entries.pop
      csv << [name] + entries.map do |entry|
        if img = (entry % "img")
          img["src"]
        else
          entry.children.first.children.first
        end
      end
    end
  end
end