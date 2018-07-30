grep -l -r -i --include \*.md  'paypal.me' ./gr_funzioni >./gr_funzioni/da_documentare.txt

questo conta le occorrenze
grep -o -r  --include \*.md  '.png' ./gr_funzioni  | wc -l
