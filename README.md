# Show-Tree (PowerShell)

A fast, readable directory tree for Windows PowerShell with exclude, depth, and color options. Prints to console only—no file output. Ideal for README file structures and quick project overviews.

## Features
- Folders first, then files, both A–Z.
- Exclude common folders like node_modules and .git.
- Optional depth limit to keep output short.
- Colorized output (folders cyan, files gray), with NoColor switch.
- Show only directories or only files.

## Installation
Option 1: Run ad-hoc
- Copy Show-Tree.ps1 content into your PowerShell session and run.

Option 2: Add to your profile
- Run: notepad $PROFILE
- Paste the function into the profile and save.
- Restart terminal, then use Show-Tree from any folder.

## Usage
Basic:
- Show-Tree

Common options:
- Show-Tree -Depth 2
- Show-Tree -NoColor
- Show-Tree -DirsOnly
- Show-Tree -FilesOnly
- Show-Tree -Exclude '.cache','coverage','dist'
- Show-Tree -Path "D:\Projects\MyApp"

Output example:
```
myapp/
├── client/
│   ├── src/
│   └── public/
└── server/
    ├── src/
    └── tests/
```
Folders show in cyan and files in gray unless -NoColor is used.

## Parameters
- Path: Root to inspect. Default: "."
- Exclude: Names to skip. Default: node_modules, .git, dist, build, .next, coverage.
- Depth: Max levels to traverse. Default: unlimited.
- NoColor: Disable colors for clean copy/paste.
- FilesOnly: Only list files.
- DirsOnly: Only list directories.

## Notes
- Uses Write-Host for crisp, aligned connectors on Windows terminals.
- Tested in Windows PowerShell 5.1 and PowerShell 7+.

## License
MIT License. See LICENSE file.

## LICENSE (MIT)
Copyright (c) 2025 Aftab Alam

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
