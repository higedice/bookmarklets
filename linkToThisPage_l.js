(function (title, url) {
	var	TAGOPEN = '&amp;lt;',
		TAGCLOSE = '&amp;gt;',
		subw = window.open().document,
		makeList = function (url, opt_target) {
			var str = '<li>'
				+ TAGOPEN + 'a href="' + url + '"'
				+ (opt_target ? ' target="' + opt_target + '"' : "") 
				+ TAGCLOSE
				+ title + TAGOPEN + '/a' + TAGCLOSE
				+ '</li>';
			return str;
		};

	subw.writeln('<html><head><title>Links</title></head><body>');
	subw.writeln('<ul>');

	subw.writeln("<li>" + title + " " + url + "</li>");
	subw.writeln(makeList(url));
	subw.writeln(makeList(url, '_blank'));
	subw.writeln(makeList(url, '_top'));

	subw.writeln('</ul>');
	subw.writeln('</body></html>');

})(window.document.title, window.document.URL);
