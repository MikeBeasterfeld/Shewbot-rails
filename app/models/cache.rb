class Cache

  def self.visit(remote_ip)
		visit_hash = Rails.cache.read('visitors')

		visit_hash = {} if visit_hash.nil?
		epoch = Time.now.to_i

		visit_hash.each do |ip, time|
			visit_hash.delete(ip) if time < epoch - 9
		end

		visit_hash[remote_ip] = epoch

		Rails.cache.write('visitors', visit_hash)
	end

	def self.visitor_count
		visit_hash = Rails.cache.read('visitors')
		visit_hash.count
	end

end
