# Generated by Django 3.1.2 on 2020-11-29 01:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dutchmanserve', '0014_auto_20201128_1952'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organization',
            name='imagepath',
            field=models.FileField(blank=True, null=True, upload_to=''),
        ),
    ]
