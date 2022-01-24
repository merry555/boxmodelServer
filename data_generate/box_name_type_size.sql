SELECT BOX_NO as box_name, BOX_TP as box_symbol, substring( BOX_NM, 1, 3) as box_code, BOX_WIDTH, BOX_LENGTH, BOX_HEIGHT from fsswms.tb_wh_box
where WH_CD='DT01' and USE_YN ='Y' and box_div='1'