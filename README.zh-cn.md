# hustvisual

[![Latest Document](https://img.shields.io/github/v/release/hust-latex/hustvisual?label=Docs)](https://github.com/hust-latex/hustvisual/releases/latest/download/hustvisual.pdf)
[![GitHub Release](https://img.shields.io/github/v/release/hust-latex/hustvisual?label=Release)](https://github.com/hust-latex/hustvisual/releases/latest)
[![CTAN](https://img.shields.io/ctan/v/hustvisual?label=CTAN)](https://www.ctan.org/pkg/hustvisual)
![GitHub repo size](https://img.shields.io/github/repo-size/hust-latex/hustvisual)

> English version [click here](https://github.com/hust-latex/hustvisual/blob/master/README.md).

**hustvisual** 是华中科技大学（HUST）的视觉标识汇编。
在使用本宏包前，建议查阅[使用手册](https://github.com/hust-latex/hustvisual/releases/latest/download/hustvisual.pdf)，其中详细介绍了宏包的使用方法和注意事项。

## 使用要求

建议使用 [TeX Live 2025](https://www.tug.org/texlive/) 或更新版本，以获得最佳体验。

## 安装方法

您可以从 [GitHub 发布页面](https://github.com/hust-latex/hustvisual/releases/latest) 下载 TDS 压缩包 [hustvisual.tds.zip](https://github.com/hust-latex/hustvisual/releases/latest/download/hustvisual.tds.zip)，
并将其中 `tex/latex/hustvisual` 目录下的文件提取到您的项目目录中。

对于命令行用户，可通过 `tlmgr` 命令安装：

```bash
tlmgr [--usermode] install hustvisual
tlmgr [--usermode] update hustvisual
```

如果您是开发者，希望参与项目开发或尝试尚未发布的新功能，可以从 GitHub 克隆本项目并使用 `l3build` 或 `make` 进行安装。

> [!IMPORTANT]
> 为确保文档编译成功，请手动将 `./visuals/` 目录添加到 `TEXINPUTS` 环境变量中。
> 详情请参考仓库中的 [`.latexmkrc`](https://github.com/hust-latex/hustvisual/blob/main/.latexmkrc) 文件。

## 许可证

本项目由 [黄宇希](https://github.com/huangyxi) 创建。
项目源代码采用 [LPPL v1.3c](https://www.latex-project.org/lppl/lppl-1-3c/) 许可证发布。
视觉标识资源（位于 `visuals/` 目录）版权归 **华中科技大学（HUST）** 所有，使用时须遵守华中科技大学官方视觉标识使用规范：[vi.hust.edu.cn](https://vi.hust.edu.cn/)。
