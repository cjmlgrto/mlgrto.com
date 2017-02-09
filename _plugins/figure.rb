module Jekyll
	module Converters
		class Markdown < Converter
			alias process convert

			def convert(content)
				# Let the Kramdown converter process the raw Markdown content first
				html = process(content)

				# Swap 'class="..."' with 'alt="..."'
				html = html.gsub(/(alt=".*")(.*)(class=".*")/i, '\3 \1')

				# Assumes we're using the Kramdown converter. Kramdown wraps <img> tags with <p>'s
				# We then replace accordingly
				html = html.gsub("<p><img", "<figure><img")
				html = html.gsub("\" /></p>", "</figcaption></figure>")
				html = html.gsub(" alt=\"", "/><figcaption>")

				# Parse ALL leftover markdown
				html = html.gsub(/\*\*(.*)\*\*/i, '<strong>\1</strong>')
				html = html.gsub(/__(.*)__/i, '<strong>\1</strong>')
				html = html.gsub(/\*(.*)\*/i, '<em>\1</em>')
				html = html.gsub(/_(.*)_/i, '<em>\1</em>')
				html = html.gsub(/\[([^\]]+)\]\(([^)]+)\)/, '<a href="\2">\1</a>')

				# Finally, we then push the updated html back as the content
				content = html
			end
		end
	end
end