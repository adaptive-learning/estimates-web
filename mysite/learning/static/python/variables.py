from django.utils.translation import ugettext as _
# -*- coding: utf-8 -*-
mainDict = {
            'nameReal' : {
                          'math': [_('Matematika'),_('Odhady matematickych prikladov'.decode("utf-8"))],
                          'curr': [_('Mena'), _("Odhady meny")],
                          'phys': [_('Jednotky'), _("Odhady jednotiek")],
                          'grap': [_('Grafické'.decode("utf-8")),_("Odhady grafických príkladov".decode("utf-8"))],
                            },
            'nameTypes' : {
                            'home': ['math','curr','phys','grap'],
                            'math': ["sqrt", "equa","sqr"],
                            'curr': ["EUR/curr", "CZK/curr"],
                            'phys': ["vol", "surf", "len", "temp"],
                            'grap': ["angle","water","line","obj"],
                            },
               
            'nameChoose' : {
                            'curr': ["own-curr"],
                            },
          
            'nameUrls' : {
                          'math': 'math',
                          'curr': 'conv',
                          'phys': 'conv',
                          'grap': 'grap',
                          },
            'typeReal' : {
                          'len':_('Dĺžka'.decode("utf-8")),
                          'curr':_('Mena'),
                          'sqrt':_('Odmocniny'),
                          'equa':_('Príklady'.decode("utf-8")),
                          'angle':_('Uhly'),
                          'e':_('Euro'),
                          'EUR/curr':_('Euro'),
                          'CZK/curr':_('Česká koruna'.decode("utf-8")),
                          'c':_('Česká koruna'.decode("utf-8")),
                          'vol':_('Objem'),
                          'surf':_('Povrch'),
                          "own-curr":_("Vlastný výber".decode("utf-8")),
                          'temp':_('Teplota'),
                          'water':_('Voda v pohári'.decode("utf-8")),
                          'line':_("Dĺžka priamky".decode("utf-8")),
                          'obj': _("Počet objektov".decode("utf-8")),
                          'sqr': _("Mocniny"),
                          },
            
            'nameTypesInDb' : {
                            'home': ['math','curr','phys','grap'],
                            'math': ["sqrt", "equa","sqr"],
                            'curr': ["curr"],
                            'phys': ["vol", "surf", "len", "temp"],
                            'grap': ["angle","water","line","obj"],
                            },
            'typeQuestions' : {
                                      "water":_("Koľko percent vody je v pohari?".decode("utf-8")),
                                      "angle":_("Koľko ° má uhol?".decode("utf-8")),
                                      "line": _("Koľko krát je spodná priamka väčšia ako vrchná?".decode("utf-8")),
                                      "obj" : _("koľko je na obrázku objektov?".decode("utf-8")),
                                      },
            }



