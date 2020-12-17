# -*- coding: utf-8 -*-

""" Calculate time differences, with semantic UI for humans """

import os
import subprocess
from albert import *

__version__ = '0.4.0'
__triggers__ = 'since '
__title__ = 'Time Since'
__exec_deps__ = ['since']
__authors__ = 'Hammed Oyedele'


def handleQuery(query):
    if query.isTriggered:
        item = Item(id=__title__, icon=iconLookup('emblem-urgent'))
        stripped = query.string.strip()

        if stripped == '':
            item.text = 'Enter time...'
            item.subtext = 'e.g "24.12.2019", "7:00", "years 24.12.2002", "days 24.12.2019"'
        else:
            item.text = subprocess.getoutput(f'since {stripped}')
            item.addAction(ClipAction('Copy result to clipboard', item.text))

        return item
