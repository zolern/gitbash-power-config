# gitbash-power-config
Some configs and settings that makes gitbash for Windows useful and pleasant

## Installation

1. Start Windows Command Prompt with Administrator Priviledges

2. Link `.bash-profile`, `.bash-prompt` and `.inputrc` in user home folder as follow:

```bash
mklink %USERPROFILE%\.bash_profile <folder-of-project>\user-home-dir\.bash_profile
mklink %USERPROFILE%\.bash_prompt <folder-of-project>\user-home-dir\.bash_prompt
mklink %USERPROFILE%\.inputrc <folder-of-project>\user-home-dir\.inputrc
```

## Git-bash and Windows Terminal

`Windows Terminal` is relative new Microsoft's product which target is to replace ancient and old-fashioned `Windows Command Prompt` with modern and powerful terminal application. See more about Windows Terminal: https://docs.microsoft.com/bg-bg/windows/terminal/

It is not so hard task to integrate git-bash in the Windows Terminal. Example profile settings for git-bash:

```bash
    ...
    "profiles":
    {
        ...
        "list":
        [
            ...
            {
                "antialiasingMode": "cleartype",
                "bellStyle": "none",
                "commandline": "%PROGRAMFILES%/git/usr/bin/bash.exe -i -l",
                "guid": "{00000000-0000-0000-ba54-000000000002}",
                "icon": "%PROGRAMFILES%/Git/mingw64/share/git/git-for-windows.ico",
                "name": "Git Bash",
                "startingDirectory": "d:\\dev",
                "suppressApplicationTitle": true,
                "tabTitle": "bash",
                "useAcrylic": false
            },
            ...
        ],
        ...
    },
    ...
```
