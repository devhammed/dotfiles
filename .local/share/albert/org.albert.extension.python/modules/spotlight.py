# -*- coding: utf-8 -*-

"""
X11 window switcher - list and activate windows.
"""

import subprocess
from shutil import which
from collections import namedtuple

from albert import *

__triggers__ = ''
__version__ = '0.4.0'
__title__ = 'Spotlight'
__exec_deps__ = ['wmctrl']
__authors__ = 'Hammed Oyedele'

Window = namedtuple('Window', [
    'wid',
    'desktop',
    'wm_class',
    'host',
    'wm_name'
])


def getWindowTitle(name: str) -> str:
    names = {
        'Vlc': 'VLC Media Player',
        'Code': 'Visual Studio Code',
    }

    sanitizedTitle = name.title().split('.')[-1].replace('-', ' ')

    return names.get(sanitizedTitle, sanitizedTitle)


def getWindowIcon(win_code: str) -> str:
    icons = {
        'spotify': 'spotify-client',
        'code': 'com.visualstudio.code',
        'org': 'org.gnome.Nautilus',
        'gnome-terminal-server': 'org.gnome.Terminal',
    }

    return iconLookup(icons.get(win_code, win_code))


def handleQuery(query):
    results = []
    stripped = query.string.strip().lower()

    for line in subprocess.check_output(['wmctrl', '-l', '-x']).splitlines():
        win = Window(*[token.decode() for token in line.split(None, 4)])
        win_code = win.wm_class.split('.')[0]

        if win.wm_name != 'albert — Albert' and win.desktop != '-1' and stripped in win_code.lower():
            results.append(
                Item(
                    id=f'{__title__}_{win.wm_class}',
                    icon=getWindowIcon(win_code),
                    text=getWindowTitle(win.wm_class),
                    subtext=win.wm_name,
                    actions=[
                        ProcAction(
                            'Switch Window',
                            ['wmctrl', '-i', '-a', win.wid],
                        ),
                        ProcAction(
                            'Close the window gracefully.',
                            ['wmctrl', '-c', win.wid],
                        ),
                    ],
                ),
            )

    return results
