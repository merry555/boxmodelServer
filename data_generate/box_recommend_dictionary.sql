use fsswms;

select
	dic.DIC_NO,
	dic.WH_CD,
	dic.USE_YN,
	god_info.GOD_CD,
	god_info.OUT_QTY,
	god_info.GOD_WIDTH,
	god_info.GOD_LENGTH,
	god_info.GOD_HEIGHT,
	god_info.BUF_GOD_YN,
	dic_box.BOX_NO,
	dic_box.BOX_TP
FROM tb_box_rcmnd_dic dic
LEFT OUTER JOIN tb_box_rcmnd_dic_box dic_box ON dic.DIC_NO = dic_box.DIC_NO
LEFT OUTER JOIN (SELECT dic_god.DIC_NO,
								dic_god.GOD_CD,
								dic_god.OUT_QTY,
								god_table.GOD_WIDTH,
								god_table.GOD_LENGTH,
								god_table.GOD_HEIGHT,
								dic_god.BUF_GOD_YN
					  FROM tb_box_rcmnd_dic_god dic_god
					  LEFT OUTER JOIN tb_god god_table ON dic_god.GOD_CD = god_table.GOD_CD
					 ) god_info ON dic.DIC_NO = god_info.DIC_NO
WHERE dic.USE_YN = 'Y'
  AND dic.WH_CD IN ('DT01', 'YI03')
  AND dic_box.BOX_NO LIKE 'fb%'
  AND dic_box.BOX_NO NOT LIKE 'fb19c%'
  AND god_info.GOD_WIDTH IS NOT NULL
  AND god_info.GOD_LENGTH IS NOT NULL
  AND god_info.GOD_HEIGHT IS NOT NULL
  AND god_info.GOD_CD IS NOT null
  and dic_box.REG_TIME > '2021-11-25 19:00:00'