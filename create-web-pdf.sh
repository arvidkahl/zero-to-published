#!/bin/bash
# Requires Calibre, qpdf, and Ghostscript to be installed
echo "Converting EPUB to PDF"
LOCATION="/Users/arvidkahl/Dropbox/The Bootstrapped Founder/Books & Articles/Zero to Sold/Dist/Zero to Sold - How to Start, Run, and Sell a Bootstrapped Business/"
SOURCE_NAME="Generic EPUB/Zero-to-Sold-Generic.epub"
TARGET_NAME="Web PDF/Zero-to-Sold"
ebook-convert "${LOCATION}${SOURCE_NAME}" "${LOCATION}${TARGET_NAME}-raw-web.pdf"  \
  --paper-size="a4" \
  --pdf-add-toc \
  --toc-title="Table of Contents" \
  --pdf-hyphenate \
  --embed-all-fonts \
  --subset-embedded-fonts \
  --smarten-punctuation \
  --keep-ligatures \
  --pdf-header-template="<div style=""color:#444;text-transform:uppercase;display:flex;flex-direction:row;width:100%;font-family:Quicksand,sans-serif;font-size:8pt;justify-content:space-between""><span style=""flex-grow:1""><strong>_TITLE_</strong> by _AUTHOR_</span><span style=""flex-grow:2;text-align:right"">_SECTION_</span></div>" \
  --pdf-footer-template="<div style=""color:#444;text-transform:uppercase;display:flex;flex-direction:row;width:100%;font-family:Quicksand,sans-serif;font-size:14pt;justify-content:space-between""><span style=""flex-grow:2;text-align:center""><strong>_PAGENUM_</strong></span></div>" \
  --authors="Arvid Kahl" \
  --isbn="978-3-9821957-2-8" \
  --title="Zero to Sold" \
  --language="en" \
  --disable-font-rescaling \
  --extra-css=".calibre-pdf-toc {font-family:Quicksand,sans-serif;} .calibre-pdf-toc table {width: 100%;line-height:16pt;} .calibre-pdf-toc .level-0{font-size: 12pt;} .calibre-pdf-toc .level-1{font-size: 12pt;} .calibre-pdf-toc .level-2{font-size:12pt;} .calibre-pdf-toc table tr td:last-of-type{font-size:12pt;font-family:Monaco,Courier New,Courier,monospace} .calibre-pdf-toc .level-1 td:first-of-type { padding-left: 2em } .calibre-pdf-toc .level-2 td:first-of-type { padding-left: 4em }"

ebook-convert "${LOCATION}${SOURCE_NAME}" "${LOCATION}${TARGET_NAME}-raw-mobile.pdf"  \
  --paper-size="a5" \
  --pdf-add-toc \
  --pdf-default-font-size="16" \
  --toc-title="Table of Contents" \
  --pdf-hyphenate \
  --embed-all-fonts \
  --subset-embedded-fonts \
  --smarten-punctuation \
  --keep-ligatures \
  --pdf-header-template="<div style=""color:#444;text-transform:uppercase;display:flex;flex-direction:row;width:100%;font-family:Quicksand,sans-serif;font-size:8pt;justify-content:space-between""><span style=""flex-grow:1""><strong>_TITLE_</strong> by _AUTHOR_</span><span style=""flex-grow:2;text-align:right"">_SECTION_</span></div>" \
  --pdf-footer-template="<div style=""color:#444;text-transform:uppercase;display:flex;flex-direction:row;width:100%;font-family:Quicksand,sans-serif;font-size:14pt;justify-content:space-between""><span style=""flex-grow:2;text-align:center""><strong>_PAGENUM_</strong></span></div>" \
  --authors="Arvid Kahl" \
  --isbn="978-3-9821957-2-8" \
  --title="Zero to Sold" \
  --language="en" \
  --disable-font-rescaling \
  --extra-css=".calibre-pdf-toc {font-family:Quicksand,sans-serif;} .calibre-pdf-toc table {width: 100%;line-height:16pt;} .calibre-pdf-toc .level-0{font-size: 14pt;} .calibre-pdf-toc .level-1{font-size: 14pt;} .calibre-pdf-toc .level-2{font-size:14pt;} .calibre-pdf-toc table tr td:last-of-type{font-size:14pt;font-family:Monaco,Courier New,Courier,monospace} .calibre-pdf-toc .level-1 td:first-of-type { padding-left: 2em } .calibre-pdf-toc .level-2 td:first-of-type { padding-left: 4em }"
echo "Optimizing PDF"
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile="${LOCATION}${TARGET_NAME}-web.pdf" "${LOCATION}${TARGET_NAME}-raw-web.pdf"
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile="${LOCATION}${TARGET_NAME}-mobile.pdf" "${LOCATION}${TARGET_NAME}-raw-mobile.pdf"
echo "Done."
