# Generated by Django 3.1.2 on 2020-11-28 00:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dutchmanserve', '0009_auto_20201127_1903'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='imagepath',
            field=models.FileField(blank=True, null=True, upload_to=''),
        ),
    ]