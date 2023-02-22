# FHW - A much more beautiful homework (HW) template made by FHVirus (FHV).

一份支援繁體中文、作業導向的 $\LaTeX$ 模板。部份內容來自 https://github.com/gijs-pennings/latex-homework 。

## 功能

除了 $\LaTeX$ 的基本功能外，還包含/引入了：

- 用 `*` 代替 `\cdot` 、一些常用的其他符號（如高斯符號、集合）。
- `\problem` ：作業習題標題。
- `\Code` ：漂亮的程式碼。
- 跟據要繳交檔案還是紙本變更 syntax highlight colorscheme 。
- 用 `\printtrue` 和 `\printfalse` 來切換檔案、影印模式，印出來會比較好看。

……等等功能，詳細說明請看 example.pdf。

有興趣可以翻翻 `fhw.cls` 裡面所引入的 package 。

## 使用方式

- `template.tex` 是一個空的檔案，可以複製當模板使用。
- 可以將 `fhw.cls` 放到與主要的 `.tex` 檔案同一個資料夾，或是將其放在 `~/texmf/tex/latex/local` 底下（沒有這個目錄可以自己建立）。
- 請使用 `pdflatex` 或 `latexmk` 並加上 `-pdfxe -shell-escape` 編譯。
- 推薦使用 [VimTex](https://github.com/lervag/vimtex) ，詳細使用方式請見官方說明及我的 dotfiles 中的 `latexmkrc` 和 `vim/plugins.vim` 。

## Dependency

請安裝以下字體：

- [源樣明體](https://github.com/ButTaiwan/genyo-font)
- [源樣黑體](https://github.com/ButTaiwan/genyog-font)
- Noto Serif CJK TC
- Noto Sans CJK TC
- Noto Sans Mono
- Noto Sans Mono CJK TC

前二者可以點連結至其 Repo 的 Release 下載安裝，後者建議在 Linux 系統上以 `sudo apt install fonts-noto` 安裝。

CC0
