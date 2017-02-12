module Jekyll
	module Converters
		class Markdown < Converter
			alias process convert

			YOUTUBE = /@\[(.*)\]\([^\=]+youtube[^\=]+=([^&"\)]+[^\&)])[^\)]*\)/
			YOUTUBE_ALT = /@\[(.*)\]\([^\=]+youtu\.be\/([^&"\)]+[^\&)])[^\)]*\)/
			VIMEO = /@\[(.*)\]\(.+vimeo\.com\/([0-9]+)\)/

			IMAGE = /(alt=".*")(.*)(class=".*")/

			BOLD = /([\-\— ])\*\*(.*)\*\*([\.\-?!:\— \n])/i
			BOLD_ALT = /([\-\— ])__(.*)__([\.\-?!:\— \n])/i
			ITALIC = /([\-\— ])\*(.*)\*([\.\-?!:\— \n])/i
			ITALIC_ALT = /([\-\— ])_(.*)_([\.\-?!:\— \n])/i
			LINK = /\[([^\]]+)\]\(([^)]+)\)/

			YOUTUBE_SUB = '<figure><div class="embed"><iframe width="1280" height="720" src="https://www.youtube-nocookie.com/embed/\2?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe></div><figcaption>\1</figcaption></figure>'
			VIMEO_SUB = '<figure><div class="embed"><iframe src="https://player.vimeo.com/video/\2?color=FFFFFF&title=0&byline=0&portrait=0" width="1280" height="720" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div><figcaption>\1</figcaption></figure>'

			BOLD_SUB = '\1<strong>\2</strong>\3'
			ITALIC_SUB = '\1<em>\2</em>\3'

			def convert(content)

				content = content.gsub(YOUTUBE,YOUTUBE_SUB)
				content = content.gsub(YOUTUBE_ALT,YOUTUBE_SUB)
				content = content.gsub(VIMEO,VIMEO_SUB)

				html = process(content)

				html = html.gsub(IMAGE, '\3 \1')
				html = html.gsub("<p><img", "<figure><img")
				html = html.gsub("\" /></p>", "</figcaption></figure>")
				html = html.gsub(" alt=\"", "/><figcaption>")

				html = html.gsub(BOLD, BOLD_SUB)
				html = html.gsub(BOLD_ALT, BOLD_SUB)
				html = html.gsub(ITALIC, ITALIC_SUB)
				html = html.gsub(ITALIC_ALT, ITALIC_SUB)
				html = html.gsub(LINK, '<a href="\2">\1</a>')

				content = html
			end
		end
	end
end