select * from bankchurners;

-- rata2 Jangka waktu hubungan dengan bank (months on book) 
-- berdasarkan kategori kartu 

select card_category, avg(months_on_book) as avg_months_on_book
from bankchurners
group by Card_Category
order by avg_months_on_book;

-- Jumlah total. produk yang dimiliki oleh pelanggan (Total relationship count)
-- berdasarkan pendidikan 

select education_level, sum(total_relationship_count) as total_relationship_count
from bankchurners
group by education_level
order by total_relationship_count;

-- jenis kartu kredit yang paling banyak 
-- melakukan transaksi dalam 12 bulan terakhir (total_trans_ct)

select card_category, avg(total_trans_ct) avg_trans, sum(total_trans_ct) sum_trans
from bankchurners
group by Card_Category
order by avg_trans;

-- hubungan gender dan jenis kartu kredit terhdap
-- jumlah transaksi yang dilakukan dalam 12 bulan
-- terakhir (total trans ct)

select card_category, gender, avg(total_trans_ct) avg_trans, sum(total_trans_ct) sum_trans
from bankchurners
group by Card_Category, gender
order by Card_Category, gender;

-- rerata limit kredit (credit limit) berdasarkan kategori usia
select 
case
when customer_age < 30 then "young"
when customer_age < 50 then "adult"
else
"old"
end as age_criteria, avg(Credit_Limit) as avg_credit_limit
from bankchurners
group by age_criteria
order by avg_credit_limit;

-- rerata Jumlah bulan tidak aktif dalam 12 bulan terakhir
-- berdasarkan gender dan kategori umur (months inactive 12 month)

select
case
when customer_age < 30 then "young"
when customer_age < 50 then "adult"
else
"old"
end as age_category,
gender, avg(months_inactive_12_mon) as avg_inactive_12_mon
from bankchurners
group by age_category, gender
order by age_category, gender;

-- hubungan banyak tanggungan (dependent count) dgn
-- total pengeluaran (total trans amt)

select dependent_count, avg(total_trans_amt) as avg_trans_amt, 
						sum(total_trans_amt) as sum_trans_amt,
                        count(total_trans_amt) as total_trans_amt
from bankchurners
group by Dependent_count
order by Dependent_count;