use classicmodels;


select productVendor, count(productCode) from products
where productline = 'Motorcycles'
group by productVendor
order by productVendor;

select productVendor, count(productCode) from products
where productline = 'Motorcycles'
group by productVendor
having count(productCode) > 10
order by productVendor

