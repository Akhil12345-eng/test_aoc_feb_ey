@EndUserText.label: 'table function'
define table function ZEY_AAA_TF
with parameters 
@Environment.systemField: #CLIENT
p_clnt : abap.clnt
returns {
 client : abap.clnt;
 company_name: abap.char(256);
 total_sales: abap.curr(15,2);
 currency_code: abap.cuky(5);
 customer_rank: abap.int4; 
 }
implemented by method zcl_ey_aaa_amdp=>get_total_sales;