# Options and directories ------------------------------------------------------
# Option for R
R_OPTS=--vanilla

# Name targets -----------------------------------------------------------------
syllabus: syllabus/syllabus.pdf
lec000 : lecture/000/slides.html lecture/000/slides.pdf
lec001 : lecture/001/slides.html lecture/001/slides.pdf
lec002 : lecture/002/slides.html lecture/002/slides.pdf
lec003 : lecture/003/slides.html lecture/003/slides.pdf
lec004 : lecture/004/slides.html lecture/004/slides.pdf
lec005 : lecture/005/slides.html lecture/005/slides.pdf
lec006 : lecture/006/slides.html lecture/006/slides.pdf
lec007 : lecture/007/slides.html lecture/007/slides.pdf
lec008 : lecture/008/slides.html lecture/008/slides.pdf
lec009 : lecture/009/slides.html lecture/009/slides.pdf

# Define individual links ------------------------------------------------------
# Build syllabus
syllabus/syllabus.pdf : syllabus/syllabus.tex
	tectonic syllabus/syllabus.tex
# Lecture 00
lecture/000/slides.html : lecture/000/slides.rmd
	Rscript -e "rmarkdown::render('$<')"
lecture/000/slides.pdf : lecture/000/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"
# Lecture 01
lecture/001/slides.html : lecture/001/slides.rmd
	Rscript -e "rmarkdown::render('$<')"
lecture/001/slides.pdf : lecture/001/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"
# Lecture 02
lecture/002/slides.html : lecture/002/slides.rmd
	Rscript -e "rmarkdown::render('$<')"
lecture/002/slides.pdf : lecture/002/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"
# Lecture 03
lecture/003/slides.html : lecture/003/slides.rmd
	Rscript -e "rmarkdown::render('$<')"
lecture/003/slides.pdf : lecture/003/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"
# Lecture 04
lecture/004/slides.html : lecture/004/slides.rmd
	Rscript -e "rmarkdown::render('$<')"
lecture/004/slides.pdf : lecture/004/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"
# Lecture 05
lecture/005/slides.html : lecture/005/slides.rmd
	Rscript -e "rmarkdown::render('$<')"
lecture/005/slides.pdf : lecture/005/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"
# Lecture 06
lecture/006/slides.html : lecture/006/slides.rmd
	Rscript -e "rmarkdown::render('$<')"
lecture/006/slides.pdf : lecture/006/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"
# Lecture 07
lecture/007/slides.html : lecture/007/slides.rmd
	Rscript -e "rmarkdown::render('$<')"
lecture/007/slides.pdf : lecture/007/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"
# Lecture 08
lecture/008/slides.html : lecture/008/slides.rmd
	Rscript -e "rmarkdown::render('$<')"
lecture/008/slides.pdf : lecture/008/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"
# Lecture 09
lecture/009/slides.html : lecture/009/slides.rmd
	Rscript -e "rmarkdown::render('$<')"
lecture/009/slides.pdf : lecture/009/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"

# Global targets ---------------------------------------------------------------
lec-all: lec000 lec001 lec002 lec003 lec004 lec005 lec006 lec007 lec008 lec009
all: lec-all syllabus
# Define clean
clean:
	rm -f lec-all
