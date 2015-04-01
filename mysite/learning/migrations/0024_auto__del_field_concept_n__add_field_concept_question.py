# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting field 'Concept.n'
        db.delete_column(u'learning_concept', 'n_id')

        # Adding field 'Concept.question'
        db.add_column(u'learning_concept', 'question',
                      self.gf('django.db.models.fields.related.ForeignKey')(to=orm['learning.Questions'], null=True),
                      keep_default=False)


    def backwards(self, orm):
        # Adding field 'Concept.n'
        db.add_column(u'learning_concept', 'n',
                      self.gf('django.db.models.fields.related.ForeignKey')(to=orm['learning.Questions'], null=True),
                      keep_default=False)

        # Deleting field 'Concept.question'
        db.delete_column(u'learning_concept', 'question_id')


    models = {
        u'auth.group': {
            'Meta': {'object_name': 'Group'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        u'auth.permission': {
            'Meta': {'ordering': "(u'content_type__app_label', u'content_type__model', u'codename')", 'unique_together': "((u'content_type', u'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['contenttypes.ContentType']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Group']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Permission']"}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        u'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'learning.concept': {
            'Meta': {'object_name': 'Concept'},
            'hint': ('django.db.models.fields.BooleanField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'label': ('django.db.models.fields.FloatField', [], {'null': 'True'}),
            'params': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'params'", 'to': u"orm['learning.Params']"}),
            'question': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['learning.Questions']", 'null': 'True'}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['learning.Type']"}),
            'updatedTimes': ('django.db.models.fields.IntegerField', [], {'default': '0'})
        },
        u'learning.currtable': {
            'Meta': {'object_name': 'CurrTable'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'params': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['learning.Params']"}),
            'rate': ('django.db.models.fields.FloatField', [], {})
        },
        u'learning.floatmodel': {
            'Meta': {'object_name': 'FloatModel'},
            'answer': ('django.db.models.fields.FloatField', [], {}),
            'concept': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['learning.Concept']"}),
            'date': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'label': ('django.db.models.fields.FloatField', [], {'null': 'True'}),
            'result': ('django.db.models.fields.FloatField', [], {}),
            'time': ('django.db.models.fields.IntegerField', [], {}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['learning.Type']"}),
            'usedHint': ('django.db.models.fields.BooleanField', [], {}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['auth.User']", 'null': 'True'})
        },
        u'learning.params': {
            'Meta': {'object_name': 'Params'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'p1': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'p2': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True'}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['learning.Type']"})
        },
        u'learning.questions': {
            'Meta': {'object_name': 'Questions'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'question': ('django.db.models.fields.FloatField', [], {'unique': 'True'})
        },
        u'learning.type': {
            'Meta': {'object_name': 'Type'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'type': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '8'})
        },
        u'learning.userskill': {
            'Meta': {'object_name': 'UserSkill'},
            'concept': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['learning.Params']"}),
            'date': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'number': ('django.db.models.fields.IntegerField', [], {}),
            'skill': ('django.db.models.fields.FloatField', [], {}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['auth.User']"})
        }
    }

    complete_apps = ['learning']