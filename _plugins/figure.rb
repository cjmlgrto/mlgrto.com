module Jekyll
	module Converters
		class Markdown < Converter
			alias process convert
			
			# RegEx for Vimeo and YouTube URLs
			V = /@\[(.*)\]\(.+vimeo\.com\/([0-9]+)\)/
			Y = /@\[(.*)\]\([^\=]+youtube[^\=]+=([^&"\)]+[^\&)])[^\)]*\)/
			Y_ALT = /@\[(.*)\]\([^\=]+youtu\.be\/([^&"\)]+[^\&)])[^\)]*\)/

			# RegEx for Markdown images
			IMAGE = /!\[(.*)\]\(([^\)]+)\)(?:{:([^}]+)})*/
			
			# RegEx for Markdown styles
			LINK = /<figcaption>(.*)\[([^\]]+)\]\(([^)]+)\)(.*)<\/figcaption>/
			ITALIC = /<figcaption>(.*)([\-\— ])\*(.*)\*([\.\-?!:\— \n])(.*)<\/figcaption>/i
			ITALIC_ALT = /<figcaption>(.*)([\-\— ])_(.*)_([\.\-?!:\— \n])(.*)<\/figcaption>/i
			BOLD = /<figcaption>(.*)([\-\— ])\*\*(.*)\*\*([\.\-?!:\— \n])(.*)<\/figcaption>/i
			BOLD_ALT = /<figcaption>(.*)([\-\— ])__(.*)__([\.\-?!:\— \n])(.*)<\/figcaption>/i

			# Substitutes for Vimeo and YouTube URLs
			Y_EMBED = '<figure>' +
						'<div class="embed">' +
						'<iframe width="1280" height="720" src="https://www.youtube-nocookie.com/embed/'+
						'\2' +
						'?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>' +
						'</div>' +
						'<figcaption>' +
						'\1' +
						'</ficaption>' +
						'</figure>'
			V_EMBED = '<figure>' +
						'<div class="embed">' +
						'<iframe src="https://player.vimeo.com/video/' +
						'\2' +
						'?color=FFFFFF&title=0&byline=0&portrait=0" ' +
						'width="1280" height="720" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>' +
						'</div>' +
						'<figcaption>' +
						'\1' +
						'</figcaption>' +
						'</figure>'

			# Substitutes for images
			IMG = '<figure>' +
						'<img src="' +
						'\2' + '" ' +
						'\3' +
						'/>' +
						'<figcaption>' +
						'\1' +
						'</figcaption>' +
						'</figure>'

			# Substitutes for styles
			EM = '<figcaption>\1\2<em>\3</em>\4\5</figcaption>'
			URL = '<figcaption>\1<a href="\3">\2</a>\4</figcaption>'
			STRONG = '<figcaption>\1\2<strong>\3</strong>\4\5</figcaption>'

			def convert(content)

				# Convert videos and images to their substitutes
				content = content.gsub(V,V_EMBED)
				content = content.gsub(Y,Y_EMBED)
				content = content.gsub(Y_ALT,Y_EMBED)
				content = content.gsub(IMAGE, IMG)

				# Get Kramdown to process the raw content as Markdown
				html = process(content)

				# Process the leftover Markdown within <figcaption>s
				html = html.gsub(BOLD, STRONG)
				html = html.gsub(BOLD_ALT, STRONG)
				html = html.gsub(ITALIC, EM)
				html = html.gsub(ITALIC_ALT, EM)
				html = html.gsub(LINK, URL)

				content = html
			end
		end
	end
end