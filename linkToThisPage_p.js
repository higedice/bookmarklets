(function (title, url) {
	var	SP = ' ',
		pf = window.prompt,
		printHTML = function (prompt, url, opt_target) {
			return pf(prompt, 
				'<a href="' + url + '"' + (opt_target ? SP + 'target="' + opt_target + '"' : "") + '>'
				+ title
				+ '</a>');
		},
		s;

	s = pf('Text', title + SP + url);
	if (!s) {
		s = printHTML('HTML', url);
	}
	if (!s) {
		s = printHTML('HTML _blank', url, '_blank');
	}
	if (!s) {
		s = printHTML('HTML _top', url, '_top');
	}
})(window.document.title, window.document.URL);
