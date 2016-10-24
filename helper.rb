module Helper
	def constantize(str)
		classify(str).split('::').reduce(Module, :const_get)
	end

	def classify(str)
		camelize(str.sub(/.*\./, ''))
	end

	def camelize(str)
    str = str.sub(/^[a-z\d]*/) { $&.capitalize }
    str.gsub(/(?:_|(\/))([a-z\d]*)/) { "#{$1}#{$2.capitalize}" }.gsub('/', '::')
  end
end
