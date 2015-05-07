# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ak_ttl',
            fields=[
                ('app_id', models.CharField(max_length=50, serialize=False, primary_key=True)),
                ('access_token', models.CharField(max_length=512)),
                ('expires_in', models.CharField(max_length=50)),
                ('get_time', models.DateTimeField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='weixin_config',
            fields=[
                ('app_id', models.CharField(max_length=50, serialize=False, primary_key=True)),
                ('app_secret', models.CharField(max_length=50)),
                ('token', models.CharField(max_length=50)),
            ],
        ),
    ]
