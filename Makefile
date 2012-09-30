COMPRESSOR	= java com.yahoo.platform.yui.compressor.Bootstrap
# COMPRESSOR	= java -jar yuicompressor-2.4.7.jar

ENCODER		= sed -e 's/%/%25/g' | \
			  sed -e 's/ /%20/g' | \
			  sed -e 's/^/javascript:/'

MDMAKER	= awk 'BEGIN { \
				re = ARGV[1]; \
				getline <ARGV[2]; \
				js = $$0; \
				gsub(/"/, "\\\&quot;", js); \
				gsub(/&/, "\\\\\&", js); \
				close(ARGV[2]); \
				ARGV[1] = ""; \
				ARGV[2] = ""; \
			} \
			{ \
				gsub(re, js, $$0); \
				print; \
			}'

INSERT	= awk 'BEGIN { \
				re = ARGV[1]; \
				getline <ARGV[2]; \
				js = $$0; \
				gsub(/&/, "\\\\\&", js); \
				close(ARGV[2]); \
				ARGV[1] = ""; \
				ARGV[2] = ""; \
			} \
			{ \
				gsub(re, js, $$0); \
				print; \
			}'

TARGET_P	= linkToThisPage_p.js
MINTARGET_P	= linkToThisPage_p-min.js
TARGET_L	= linkToThisPage_l.js
MINTARGET_L	= linkToThisPage_l-min.js
SRCMD		= index.src.md
OUTMD		= index.md
TMPFILE		= tmp.tmp


RMCMD		= rm -f
# RMCMD		= del


all: $(OUTMD)

$(OUTMD): $(MINTARGET_P) $(MINTARGET_L) $(SRCMD)
	$(MDMAKER) "BOOKMARKLET01-A" $(MINTARGET_P) $(SRCMD) >$(TMPFILE)
	$(MDMAKER) "BOOKMARKLET02-A" $(MINTARGET_L) $(TMPFILE) >$(OUTMD)
	$(INSERT)  "BOOKMARKLET01-MIN" $(MINTARGET_P) $(OUTMD) >$(TMPFILE)
	$(INSERT)  "BOOKMARKLET02-MIN" $(MINTARGET_L) $(TMPFILE) >$(OUTMD)
	$(RMCMD) $(TMPFILE)

$(MINTARGET_P): $(TARGET_P)
	$(COMPRESSOR) $(TARGET_P) -v | $(ENCODER) >$(MINTARGET_P)

$(MINTARGET_L): $(TARGET_L)
	$(COMPRESSOR) $(TARGET_L) -v | $(ENCODER) >$(MINTARGET_L)


.PHONY : clean
clean :
	$(RMCMD) $(MINTARGET_P) $(MINTARGET_L) $(OUTMD) $(TMPFILE)

