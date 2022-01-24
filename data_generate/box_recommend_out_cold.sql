SELECT a.WH_CD
		,a.OUT_ORD_SLIP_NO
		,a.invoice_no
      ,a.god_cd
      ,a.pack_qty
      ,b.god_width
      ,b.god_length
      ,b.god_height
      ,a.box_no
from tb_out_pack a
left outer join tb_god b on a.god_cd = b.god_cd
WHERE a.PACK_DT BETWEEN '20210816' AND '20210831'
  AND a.WH_CD IN ('YI00')
  AND a.INVOICE_NO IS NOT NULL
  AND a.box_no IS NOT NULL
  AND a.BOX_NO LIKE 'EPSB%'
  AND b.GOD_WIDTH IS NOT NULL
  AND 0 < b.GOD_WIDTH <= 65
  AND b.GOD_LENGTH IS NOT NULL
  AND 0 < b.GOD_LENGTH <= 65
  AND b.GOD_HEIGHT IS NOT NULL
  AND 0 < b.GOD_HEIGHT <= 65
  AND !(b.GOD_WIDTH <= 1 OR b.GOD_LENGTH <= 1 OR b.GOD_HEIGHT <= 1)
;