# -*- coding: utf-8 -*-

""" Calculate time differences, with semantic UI for humans """

import os
import subprocess
from albertv0 import *

__iid__ = 'PythonInterface/v0.1'
__prettyname__ = 'Time Since'
__version__ = '1.0'
__trigger__ = 'since '
__author__ = 'Hammed Oyedele'
__dependencies__ = ['since']

def handleQuery(query):
    if query.isTriggered:
        item = Item(id=__prettyname__, icon=iconLookup('emblem-urgent'))
        stripped = query.string.strip()

        if stripped == '':
            item.text = 'Enter time...'
            item.subtext = 'e.g "24.12.2019", "7:00", "years 24.12.2002", "days 24.12.2019"'
        else:
            item.text = subprocess.getoutput(f'since {stripped}')
            item.addAction(ClipAction('Copy result to clipboard', item.text))

        return item
