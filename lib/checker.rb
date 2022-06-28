class Checker
	def initialize(args)
		array_of_hashes = []
		@page_hits = []
		@uniq_page_hits = []
		file_objects = File.foreach(args).map { |line| line.split(' ') }
		file_objects.each do |r|
			if array_of_hashes.select{|h| h[r[0]]}.empty?
				array_of_hashes.push({r[0] => [r[1]]})
			else
				array_of_hashes.select{|h| h[r[0]]}[0].values[0].push(r[1])
			end
		end
		array_of_hashes.each do |r|
			@page_hits.push({r.keys[0] => r.values.flatten.count})
			@uniq_page_hits.push({r.keys[0] => r.values.flatten.uniq.count})
		end
	end

	def views(params)
		case params
		when 'total'
			puts
			p "==========================================="
			p "List of webpages with views in ordered form"
			p "==========================================="
			@page_hits.sort_by { |element| element.values }.reverse.each { |a| p "#{a.keys[0]}  #{a.values[0]} visits" } #for terminal output	
			@page_hits.sort_by { |element| element.values }.reverse
		when 'uniq'	
			puts
			p "================================================"
			p "List of webpages with uniq views in ordered form"
			p "================================================"

			@uniq_page_hits.sort_by { |element| element.values }.reverse.each { |a| p "#{a.keys[0]}  #{a.values[0]} visits" } #for terminal output
			@uniq_page_hits.sort_by { |element| element.values }.reverse
		end
	end
end