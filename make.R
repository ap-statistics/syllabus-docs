#HTML bookdown output
rmarkdown::render_site(output_format = 'bookdown::gitbook', encoding = 'UTF-8')
#PDF bookdown output
rmarkdown::render_site(output_format = 'bookdown::pdf_book', encoding = 'UTF-8')

#list file names in folder
wd <- getwd()
rmd <- list.files(file.path(wd), pattern=".\\.Rmd")
i <- grep("^index", rmd)

#knit by chapter (html)
#p = find file position in rmd vector
p <- grep("^01", rmd)
bookdown::preview_chapter(rmd[p])

#output handbook to Word
bookdown::render_book(rmd[i],
          output_format = "bookdown::word_document2",
          output_file = paste0("AP_Research_Handbook", "_", format(Sys.Date(), ("%Y-%m-%d")), ".docx"),
          output_dir = "msword",                          ,
          output_options = list(reference_docx = file.path("msword","word-style-ref.docx")))

#output chapter preview to Word
bookdown::preview_chapter(rmd[p],
          output_format = "bookdown::word_document2",
          output_file = paste0(gsub("\\.Rmd$", "", rmd[p]), "_", format(Sys.Date(), ("%Y-%m-%d")), ".docx"),
          output_dir = "msword",                          ,
          output_options = list(reference_docx = file.path("msword","word-style-ref.docx")))

#after Word document is outputted,
#use ApplyTableStyle() marco in Word document to apply "Style1" to all tables.
