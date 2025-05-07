# hustvisual

[![Latest Document](https://img.shields.io/github/v/release/hust-latex/hustvisual?label=Docs)](https://github.com/hust-latex/hustvisual/releases/latest/download/hustvisual.pdf)
[![GitHub Release](https://img.shields.io/github/v/release/hust-latex/hustvisual?label=Release)](https://github.com/hust-latex/hustvisual/releases/latest)
[![CTAN](https://img.shields.io/ctan/v/hustvisual?label=CTAN)](https://www.ctan.org/pkg/hustvisual)
![GitHub repo size](https://img.shields.io/github/repo-size/hust-latex/hustvisual)

> 中文版请[点击这里](https://github.com/hust-latex/hustvisual/blob/master/README.zh-cn.md)。

**hustvisual** is a collection of visual identity assets for Huazhong University of Science and Technology (HUST).
Before using this package, please read the [user manual](https://github.com/hust-latex/hustvisual/releases/latest/download/hustvisual.pdf), which provides detailed instructions on how to use the package.

## Requirements

For the best experience, please use [TeX Live 2025](https://www.tug.org/texlive/) or a later version.

## Installation

You can download the TeX Directory Structure (TDS) file [hustvisual.tds.zip](https://github.com/hust-latex/hustvisual/releases/latest/download/hustvisual.tds.zip) from the [GitHub Releases page](https://github.com/hust-latex/hustvisual/releases/latest) and extract the contents of the `tex/latex/hustvisual` folder into your project directory.

For command-line installation via `tlmgr`, use the following commands:

```bash
tlmgr [--usermode] install hustvisual
tlmgr [--usermode] update hustvisual
```

If you are a developer interested in contributing to the project or testing the latest features, you can clone the repository from GitHub and install the package using either `l3build` or `make`.

> [!IMPORTANT]
> To compile the document correctly, you must manually add the `./visuals/` directory to your `TEXINPUTS` environment variable.
> Refer to the [`.latexmkrc`](https://github.com/hust-latex/hustvisual/blob/main/.latexmkrc) file in the repository for more details.

## License
This project was created by [Huang Yuxi](https://github.com/huangyxi).
The source code of this project is licensed under the [LPPL v1.3c](https://www.latex-project.org/lppl/lppl-1-3c/).
The visual identity assets (found in the `visuals/` directory) are © **Huazhong University of Science and Technology (HUST)** and must be used in accordance with the official guidelines available at [vi.hust.edu.cn](https://vi.hust.edu.cn/).
