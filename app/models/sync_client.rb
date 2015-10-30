class SyncClient

	def run

		pocket     = Pocket.new
		instapaper = Instapaper.new

		(pocket.unread_articles - instapaper.unread_articles).each do |article|
			if instapaper.is_archive?(article)
				pocket.archive(article)	
			else
				instapaper.add(article)
			end
		end
		
		(instapaper.unread_articles - pocket.unread_articles).each do |article|
			if pocket.is_archive?(article)
				instapaper.archive(article)	
			else
				pocket.add(article)
			end
		end
	end

end