# -*- coding: utf-8 -*-

""" Convert Text Cases """

import os
import subprocess
from albertv0 import *

__iid__ = 'PythonInterface/v0.1'
__prettyname__ = 'Convert Case'
__version__ = '1.0'
__trigger__ = 'case '
__author__ = 'Hammed Oyedele'
__dependencies__ = ['dtool']

icon = iconLookup('emblem-urgent')

cases = {
  'u': 'upper',
  'l': 'lower',
  't': 'title',
  'c': 'camel',
  'p': 'pascal',
  's': 'snake',
  'ss': 'shouty_snake',
  'k': 'kebab',
  'sc': 'sarcasm'
}

def handleQuery(query):
    if query.isTriggered:
        stripped = query.string.strip()

        if stripped == '':
            return Item(id=__prettyname__, icon=icon, text='Enter casing and word', subtext='Mods: u (uppper), l (lower), t (title), c (camel), p (pascal), s (snake), ss (shouty snake e.g constants case), k (kebab), sc (sarcasm, leet)')
        else:
            args = stripped.split(' ')
            
            if len(args) > 1:
                case = cases.get(args[0], 's')
                text = ' '.join(args[1:])
                result = subprocess.getoutput(f'dtool case -t {case} "{text}"')

                return Item(id=__prettyname__, icon=icon, text=result, actions=[ClipAction('Copy result to clipboard', result)])

            return []
