
select m.model, b.brand, cg.corporategroup, c.dt_purchase, c.enrolment, c2.colour, c.nkm, i.insurancecompany, hi.policy_insurance 
from irene_pozoparejo.corporate_groups cg left join irene_pozoparejo.brands b on cg.idgroup = b.idgroup 
left join irene_pozoparejo.models m on b.idbrand = m.idbrand 
left join irene_pozoparejo.cars c on m.idmodel = c.idmodel 
left join irene_pozoparejo.hist_insurance hi on c.idcar = hi.idcar 
left join irene_pozoparejo.insurances i on hi.idinsurance = i.idinsurance 
left join irene_pozoparejo.colours c2 on c.idcolour = c2.idcolour 