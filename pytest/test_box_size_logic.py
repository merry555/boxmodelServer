from py3dbp import Packer, Bin, Item
import json
import pandas as pd
from pydantic import BaseSettings
from typing import Dict
import pytest
import string


class Settings(BaseSettings):
    CSV_FILE: str
    BOX_SIZE: Dict = {}

    class Config:
        env_file = 'config_size_test.env'

    def read_json(self):
        with open('box_config.json') as json_file:
            json_data = json.load(json_file)
            self.BOX_SIZE = json_data['box_list']

# read settings
settings = Settings()
settings.read_json()

box_volume_list = {}
for k, v in settings.BOX_SIZE.items():
    box_volume_list[k] = v[0]*v[1]*v[2]

# sort volume list
box_volume_list = {k:v for k, v in sorted(box_volume_list.items(), key=lambda x: x[1])}

# read dataset
df = pd.read_csv(settings.CSV_FILE)
dfgb = df.groupby('DIC_NO')


@pytest.mark.parametrize("group_name, df_group", dfgb )
def test_box_size(group_name, df_group):
    item_list = []
    item_volume_sum = 0
    box_no = ''

    for row_idx, row in df_group.iterrows():
        box_no = row['BOX_NO']
        name = row['GOD_CD']
        qty = int(row['OUT_QTY'])
        w = row['GOD_WIDTH']
        l = row['GOD_LENGTH']
        h = row['GOD_HEIGHT']
        buf = row['BUF_GOD_YN']
        if buf != 'N':
            w += 1.0
            l += 1.0
            h += 1.0
        for _ in range(qty):
            item_list.append(Item(str(name), w, l, h, 0))
            item_volume_sum += w * l * h

    # model 의 영역.
    if len(item_list) > 5:
        return

    packer = Packer()
    for k, v in settings.BOX_SIZE.items():
        packer.add_bin(Bin(k, v[0], v[1], v[2], 10000))

    for item in item_list:
        packer.add_item(item)

    box_no = box_no[2:].rstrip(string.digits)
    box_no = box_no.upper()

    packer.pack()
    for bin in packer.bins:
        if len(bin.unfitted_items) > 0:
            continue
        else:
            assert box_no == bin.name, "DIC %s [%d] : LOGIC %s [ %d ]"\
                                       % (box_no, (item_volume_sum / box_volume_list[box_no])*100,
                                          bin.name, (item_volume_sum / box_volume_list[bin.name])*100)
            return


