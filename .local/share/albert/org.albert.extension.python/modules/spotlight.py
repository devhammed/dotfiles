# -*- coding: utf-8 -*-

"""
X11 window switcher - list and activate windows.
"""

import subprocess
from shutil import which
from collections import namedtuple

from albertv0 import *

__iid__ = 'PythonInterface/v0.1'
__prettyname__ = 'Spotlight'
__version__ = '1.0'
__author__ = 'Hammed Oyedele'
__dependencies__ = ['wmctrl']

if which('wmctrl') is None:
    raise Exception('"wmctrl" is not in $PATH.')

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

    return f'<i>{names.get(sanitizedTitle, sanitizedTitle)}</i>'


def getWindowIcon(win_code: str) -> str:
    icons = {
        'code': 'com.visualstudio.code',
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
                    id=f'{__prettyname__}_{win.wm_class}',
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
