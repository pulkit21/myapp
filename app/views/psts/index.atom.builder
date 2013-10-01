atom_feed do |feed|
	feed.title "My Blog feed"
	@psts.each do |pst|
		feed.entry(pst) do |entry|
			entry.title pst.title
			entry.content pst.body
		end
	end
end